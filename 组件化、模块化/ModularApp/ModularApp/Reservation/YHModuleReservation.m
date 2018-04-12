//
//  YHModuleReservation.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "YHModuleReservation.h"
#import "Router.h"
#import "YHRestaurantViewController.h"

@implementation YHModuleReservation

+ (UIViewController *)restaurantViewControllerWithId:(NSString *)restaurantId {
    
    YHRestaurantViewController *vc = [[YHRestaurantViewController alloc] init];
    vc.restaurantId = restaurantId;
    return vc;
}

+ (void)load {
    [[Router shareInstance] registerURLPattern:@"yhouse://restaurant" toHandler:^(NSDictionary *param) {
        YHRestaurantViewController *vc = [[YHRestaurantViewController alloc] init];
        vc.restaurantId = param[@"restaurantId"];
        [(UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController pushViewController:vc animated:YES];
    }];
}

@end
