//
//  SCLoginViewModel.h
//  MVVMExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

/**
 登录页的 view model
 */
@interface SCLoginViewModel : NSObject

@property (nonatomic, strong) NSString  *userName;
@property (nonatomic, strong) NSString  *password;

@property (nonatomic, strong) RACSignal *validSignal; ///< 按钮是否可点的信号，一个布尔信号

/// 登录请求的结果信号
@property (nonatomic, strong) RACSubject *successSubject; ///< 成功信号
@property (nonatomic, strong) RACSubject *failureSubject; ///< 失败信号


/**
 *  登陆操作
 */
- (void)login;

@end
