//
//  YHModuleUser.h
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 用户模块
 */
@interface YHModuleUser : NSObject

+ (UIViewController *)userViewControllerWithId:(NSString *)userId;

+ (UIViewController *)loginControllerWithCompletionHandler:(void (^)(BOOL))completionHandler;

@end
