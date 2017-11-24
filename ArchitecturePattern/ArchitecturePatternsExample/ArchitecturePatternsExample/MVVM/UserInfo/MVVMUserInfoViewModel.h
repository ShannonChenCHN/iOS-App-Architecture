//
//  MVVMUserInfoViewModel.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>
#import "SCUser.h"

@interface MVVMUserInfoViewModel : NSObject

// UI 展示
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *avatarURLString;

// 交互逻辑
@property (strong, nonatomic) RACCommand *userInfoFetchingCommand;

// 其他数据
@property (strong, nonatomic) SCUser *user;

- (instancetype)initWithUserId:(NSString *)userId;

@end
