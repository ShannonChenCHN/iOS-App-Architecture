//
//  SCLoginViewModel.m
//  MVVMExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCLoginViewModel.h"
#import "SCLoginAPIManager.h"

@interface SCLoginViewModel ()


@property (nonatomic, strong) RACSignal *userNameSignal;  ///< 用户名改变信号

@property (nonatomic, strong) RACSignal *passwordSignal;  ///< 密码改变信号

@property (strong, nonatomic) RACSignal *isLoadingSignal; ///< 是否正在请求

@property (nonatomic, strong) SCLoginAPIManager *api;

@end

@implementation SCLoginViewModel

- (instancetype)init {
    if (self = [super init]) {
    
        _api = [SCLoginAPIManager new];
        
        _isLoadingSignal = RACObserve(self.api, isLoading);
        _userNameSignal = RACObserve(self, userName);
        _passwordSignal = RACObserve(self, password);
        _successSubject = [RACSubject subject];
        _failureSubject = [RACSubject subject];
    
    }
    return self;
}

- (RACSignal *)validSignal {

    
    RACSignal *validSignal = [RACSignal combineLatest:@[self.userNameSignal, self.passwordSignal, self.isLoadingSignal]
                                               reduce:^id(NSString *userName, NSString *password, NSNumber *isLoding) {
                                                   
                                                   // 要求用户名和密码都大于 6 位数，并且请求结束
                                                   return @(userName.length >= 6 && password.length >= 6 && ![isLoding boolValue]);
                                               }];
    
    
    
    
    return validSignal;
}

- (void)login {
    
    SCUser *user = [[SCUser alloc] init];
    user.name = self.userName;
    user.password = self.password;
    
    // 发送请求
    self.api.user = user;
    [self.api startRequestWithCompletion:^(BOOL success, id result) {
        
        if (success) {  // 成功发送成功的信号
            
            [self.successSubject sendNext:result];
            
        } else { // 如果失败发送失败的信息号
            
            [self.failureSubject sendNext:result];
        }
    }];
    
}


@end
