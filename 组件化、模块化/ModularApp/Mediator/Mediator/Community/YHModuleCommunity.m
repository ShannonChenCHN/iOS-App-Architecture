//
//  YHModuleCommunity.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "YHModuleCommunity.h"
#import "YHEventDetailViewController.h"
#import "YHEventListViewController.h"

@implementation YHModuleCommunity

+ (UIViewController *)eventDetailViewControllerWithId:(NSString *)eventId {
    YHEventDetailViewController *vc = [[YHEventDetailViewController alloc] init];
    vc.eventId = eventId;
    return vc;
}

+ (UIViewController *)eventListViewController {
    YHEventListViewController *vc = [[YHEventListViewController alloc] init];
    return vc;
}

@end
