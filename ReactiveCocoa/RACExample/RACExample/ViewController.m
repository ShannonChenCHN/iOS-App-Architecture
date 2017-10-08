//
//  ViewController.m
//  RACExample
//
//  Created by ShannonChen on 2017/10/7.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ViewController.h"

#import "SCUser.h"

#import <ReactiveCocoa.h>
#import "RACDelegateProxy.h"
#import "RACEXTScope.h"

#import "NSString+Extension.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;


@property (nonatomic, strong) SCUser *user;


@property (strong, nonatomic) RACDelegateProxy *proxy;

@end

@implementation ViewController

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 1. KVO：监听 self.user.name 的变化
    @weakify(self)
    [RACObserve(self.user, name) subscribeNext:^(NSString *name) {
        @strongify(self)
        self.nameLabel.text = name.length > 0 ? name : @"请点击屏幕以切换用户名";
    }];
    
    
    // 2. 监听用户名输入框的输入事件
//    [[self.nameField rac_textSignal] subscribeNext:^(id x) {
//        @strongify(self)
//        self.user.name = x;
//    }];

    
    
    // 3. text input: 组合监听用户名输入框和密码输入框的输入事件
    id signals = @[[self.nameField rac_textSignal],
                   [self.passwordField rac_textSignal]];
    

    // 方式一：每次不论哪个输入框被修改了，用户的输入都会被reduce成一个布尔值
//    RACSignal *formValid = [RACSignal combineLatest:signals
//                                             reduce:^(NSString *username, NSString *password) {
//                                                 return @(username.length > 0 && password.length > 0);
//                                             }];
//    
//    RAC(self.submitButton, enabled) = formValid;

    // 方式二
    [[RACSignal combineLatest:signals] subscribeNext:^(RACTuple *x) {
       @strongify(self)
        self.user.name = x.first;
        self.user.password = x.second;
        
        self.submitButton.enabled = (self.user.name.length > 0 && self.user.password.length > 0);
    }];
    
    
    // 4. control event:按钮点击事件响应
    [[self.submitButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self)
        
        NSString *userInfoDescription = [NSString stringWithFormat:@"用户名：%@ \n密码：%@",self.user.name,self.user.password];
        [self showAlertViewWithMessage:userInfoDescription];
    }];
    
    // 5. delegate: 监听代理回调（输入用户名时，点击 return 使密码输入框变为第一响应者，即输入光标移动到 passwordField 处）
    self.proxy = [[RACDelegateProxy alloc] initWithProtocol:@protocol(UITextFieldDelegate)];
    [[self.proxy rac_signalForSelector:@selector(textFieldShouldReturn:)] subscribeNext:^(id x) {
        @strongify(self)
        
        if (self.nameField.text.length > 0) {
            [self.passwordField becomeFirstResponder];
        }
    }];
    
    self.nameField.delegate = (id <UITextFieldDelegate>)self.proxy;
    
    
    // 6. notification: 注册通知
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UITextFieldTextDidEndEditingNotification object:nil] subscribeNext:^(NSNotification *notification) {
        @strongify(self)
        
        if (notification.object == self.nameField &&
            self.nameField.text.length > 0) {
            
            NSString *name = self.nameField.text;
            
            if ([name containsNoCapitalLetter] == NO) {
                [self showAlertViewWithMessage:[NSString stringWithFormat:@"用户名中不能包含大写字母：%@", name]];
            }
            
        }
        
    }];
    
    
    // 7. 同时发送多个请求，等都返回结果的时候，统一回调
    RACSignal *request1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        // 发送请求1
        [self sendRequestWithDelay:3 Completion:^(id result, NSError *error) {
            [subscriber sendNext:@"请求1发送成功"];
        }];
        
        return nil;
    }];
    
    RACSignal *request2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        // 发送请求2
        [self sendRequestWithDelay:6 Completion:^(id result, NSError *error) {
            [subscriber sendNext:@"请求2发送成功"];
        }];
        return nil;
    }];
    
    // 使用注意：几个信号，参数一的方法就几个参数，每个参数对应信号发出的数据。
    [self rac_liftSelector:@selector(handleResponse1:response2:) withSignalsFromArray:@[request1, request2]];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSArray *userNames = @[@"KOBE", @"JACK", @"Michael", @"YAOMING", @"Bruce Lee"];
   
   // RACSequence 允许任意Cocoa集合在统一且显式地进行操作
    RACSequence *normalizedLongNames = [[userNames.rac_sequence filter:^BOOL(NSString *name) {
        
        return ![name containsString:@" "];
        
    }] map:^NSString *(NSString *name) {
        
        return name.lowercaseString;
    }];
    
    self.user.name = normalizedLongNames.array[arc4random_uniform((uint32_t)normalizedLongNames.array.count)];
}

#pragma mark - Private
- (void)handleResponse1:(id)response1 response2:(id)response2 {

    [self showAlertViewWithMessage:[NSString stringWithFormat:@"%@\n%@", response1, response2]];
}


- (void)sendRequestWithDelay:(NSTimeInterval)delay Completion:(void(^)(id result,NSError *error))completion {

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (completion) {
            completion(nil, nil);
        }
        
    });
}

- (void)showAlertViewWithMessage:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"知道了", nil];
    [alertView show];
}

#pragma mark - Getter
- (SCUser *)user {
    if (!_user) {
        _user = [[SCUser alloc] init];
    }
    
    return _user;
}


@end
