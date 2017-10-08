//
//  ViewController.m
//  MVVMExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//
// 参考资料：http://zhoulingyu.com/2016/05/20/iOS——教你如何使用ReactiveCocoa和MVVM为代码解耦构建清爽APP/

#import "ViewController.h"
#import "SCUser.h"
#import "SCLoginViewModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (nonatomic, strong) SCLoginViewModel *viewModel;

@end

@implementation ViewController

/**
 需求：
 1. 做一个简单的登陆功能，两个输入框，一个登陆按钮；
 2. 简单的用户名密码验证，要求都在6位数以上即可，不符合要求时禁用登陆按钮；
 3. 点击登录按钮后，按钮禁用，同时发起登录请求，然后根据返回结果进行弹窗展示，并解除按钮禁用

 MVVM 介绍：
  - M： Model ，包括数据模型、访问数据库的操作和网络请求等
  - V： View ，包括了iOS中的 View 和 controller 组成，负责 UI 的展示，绑定 viewModel 中的属性
  - VM： ViewModel ，负责从 Model 中获取 View 所需的数据，转换成 View 可以展示的数据，并暴露公开的属性和命令供 View 进行绑定
  - Binder：在标准MVVM中没有提到的一部分，但是如果使用MVVM + ReactiveCocoa就会自然地写出这一层。这一层主要为了实现响应式编程的功能，实现 View 和 ViewModel 的同步

 MVVM 的特点：
 - 将业务逻辑从 Controller 中分离出去了
 - VM 层是独立的逻辑，脱离对 View 和 Model 的依赖
 - 职责分明，逻辑清晰
 - 易于测试
 
 ReactiveCocoa 介绍：
 - 集函数式编程和响应式编程于一身
 - 将 iOS 中的各种事件处理方式：Action、delegate、Notification、KVO 等集中到一块处理，易于管理，少了许多胶水代码

*/

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindModel];
    
}

    /**
     *  绑定Model中的各种事件
     */
- (void)bindModel {
    
    self.viewModel = [[SCLoginViewModel alloc] init];
    
    /* 实现需求一：用户名密码验证，要求都在6位数以上即可，不符合要求时禁用登陆按钮*/
    
    // 将用户名和密码的输入框文字变化信号与 view model 的 username 和 password 属性进行绑定
    // 然后再在 view modle 内部监听 username 和 password 的变化，将这两个信号组合成一个 validSignal 信号
    // 最后再将这个 validSignal 信号与登录按钮的 enabled 属性进行绑定
    RAC(self.viewModel, userName) = self.nameField.rac_textSignal;
    RAC(self.viewModel, password) = self.passwordField.rac_textSignal;
    RAC(self.loginButton, enabled) = [self.viewModel validSignal];
    
    
    
    /* 实现需求二：点击登录按钮后，按钮禁用，同时发起登录请求，然后根据返回结果进行弹窗展示，并解除按钮禁用 */
    
    // 添加按钮点击事件
    @weakify(self)
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self)
        [self.viewModel login];
    }];
    
    // 订阅登录成功信号并作出处理
    [self.viewModel.successSubject subscribeNext:^(SCUser *user) {
        
        NSString *message = [NSString stringWithFormat:@"用户名：%@\n密码：%@", user.name, user.password];
        [self showAlertViewWithTitle:@"登陆成功✔️" message:message];
    }];
    
    // 订阅登录失败信号并作出处理
    [self.viewModel.failureSubject subscribeNext:^(id x) {
        [self showAlertViewWithTitle:@"登陆失败❌" message:@"用户名或者密码错误"];
    }];
    
}

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"知道了", nil];
    [alertView show];
}


@end
