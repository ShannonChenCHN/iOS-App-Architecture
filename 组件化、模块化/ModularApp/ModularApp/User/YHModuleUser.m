//
//  YHModuleUser.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "YHModuleUser.h"
#import "Router.h"
#import "YHUserViewController.h"

@implementation YHModuleUser

+ (UIViewController *)userViewControllerWithId:(NSString *)userId {
   
    YHUserViewController *vc = [[YHUserViewController alloc] init];
    vc.userId = userId;
    return vc;
}

+ (void)load {
    [[Router shareInstance] registerURLPattern:@"yhouse://user" toHandler:^(NSDictionary *param) {
        YHUserViewController *vc = [[YHUserViewController alloc] init];
        vc.userId = param[@"userId"];
        [(UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController pushViewController:vc animated:YES];
    }];
}

@end
