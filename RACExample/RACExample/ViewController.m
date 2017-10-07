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

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;


@property (nonatomic, strong) SCUser *user;


@property (strong, nonatomic) RACDelegateProxy *proxy;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 监听 self.user.name 的变化
    @weakify(self)
    [RACObserve(self.user, name) subscribeNext:^(id x) {
        @strongify(self)
        self.nameLabel.text = x;
    }];
    
    
    // 监听用户名输入框的输入事件
//    [[self.nameField rac_textSignal] subscribeNext:^(id x) {
//        @strongify(self)
//        self.user.name = x;
//    }];
    
    
    // 组合监听用户名输入框和密码输入框的输入事件
    id signals = @[[self.nameField rac_textSignal],
                   [self.passwordField rac_textSignal]];
    
    [[RACSignal combineLatest:signals] subscribeNext:^(RACTuple *x) {
       @strongify(self)
        self.user.name = x.first;
        self.user.password = x.second;
        
        self.submitButton.enabled = (self.user.name.length > 0 && self.user.password.length > 0);
    }];
    
    
    // 按钮点击事件响应
    [[self.submitButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self)
        
        NSString *userInfoDescription = [NSString stringWithFormat:@"用户名：%@ \n密码：%@",self.user.name,self.user.password];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提交成功!" message:userInfoDescription delegate:self cancelButtonTitle:nil otherButtonTitles:@"知道了", nil];
        [alertView show];
    }];
    
    // 监听代理回调（输入用户名时，点击 return 使密码输入框变为第一响应者，即输入光标移动到 passwordField 处）
    self.proxy = [[RACDelegateProxy alloc] initWithProtocol:@protocol(UITextFieldDelegate)];
    [[self.proxy rac_signalForSelector:@selector(textFieldShouldReturn:)] subscribeNext:^(id x) {
        @strongify(self)
        
        if (self.nameField.text.length > 0) {
            [self.passwordField becomeFirstResponder];
        }
    }];
    
    self.nameField.delegate = (id <UITextFieldDelegate>)self.proxy;
    
    
    // 注册通知
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardDidChangeFrameNotification object:nil] subscribeNext:^(NSNotification *notification) {
    
        CGFloat keyboardOriginY = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue].origin.y;
        BOOL keyboardWillShow = keyboardOriginY == [UIScreen mainScreen].bounds.size.height;
        
        if (keyboardWillShow == NO) {
            NSString *userInfoDescription = @"键盘已收起";
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:userInfoDescription delegate:self cancelButtonTitle:nil otherButtonTitles:@"知道了", nil];
            [alertView show];
        }
        
    }];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    NSArray *userNames = @[@"刘备", @"乔峰", @"柯南", @"尔康", @"肖申克"];
    
    self.user.name = userNames[arc4random_uniform((uint32_t)userNames.count)];
}

#pragma mark - Getter
- (SCUser *)user {
    if (!_user) {
        _user = [[SCUser alloc] init];
    }
    
    return _user;
}


@end
