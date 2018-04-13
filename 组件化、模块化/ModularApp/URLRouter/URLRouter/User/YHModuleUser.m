//
//  YHModuleUser.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "YHModuleUser.h"
#import "YHUserViewController.h"
#import "YHLoginViewController.h"

@implementation YHModuleUser

+ (UIViewController *)userViewControllerWithId:(NSString *)userId {
   
    YHUserViewController *vc = [[YHUserViewController alloc] init];
    vc.userId = userId;
    return vc;
}

+ (UIViewController *)loginControllerWithCompletionHandler:(void (^)(BOOL))completionHandler {
    
    YHLoginViewController *vc = [[YHLoginViewController alloc] init];
    vc.completionHandler = completionHandler;
    return vc;
}

@end
