//
//  SCLoginAPIManager.h
//  MVVMExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCUser.h"

typedef void(^SCRequestCompletionHandler)(BOOL success, id result);


/**
 登录接口 API
 */
@interface SCLoginAPIManager : NSObject

@property (copy, nonatomic) SCUser *user;

@property (assign, nonatomic) BOOL isLoading; ///< 是否加载完毕

- (void)startRequestWithCompletion:(SCRequestCompletionHandler)completion;

@end
