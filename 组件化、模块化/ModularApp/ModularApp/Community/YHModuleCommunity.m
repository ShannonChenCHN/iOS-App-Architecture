//
//  YHModuleCommunity.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "YHModuleCommunity.h"
#import "YHEventDetailViewController.h"
#import "Router.h"

@implementation YHModuleCommunity

+ (UIViewController *)eventDetailViewControllerWithId:(NSString *)eventId {
    YHEventDetailViewController *vc = [[YHEventDetailViewController alloc] init];
    vc.eventId = eventId;
    return vc;
}


+ (void)load {
    [[Router shareInstance] registerURLPattern:@"yhouse://eventDeatil" toHandler:^(NSDictionary *param) {
        YHEventDetailViewController *vc = [[YHEventDetailViewController alloc] init];
        vc.eventId = param[@"eventId"];
        [(UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController pushViewController:vc animated:YES];
    }];
}

@end
