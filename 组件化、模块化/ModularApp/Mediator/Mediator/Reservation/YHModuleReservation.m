//
//  YHModuleReservation.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "YHModuleReservation.h"
#import "YHRestaurantViewController.h"

@implementation YHModuleReservation

+ (UIViewController *)restaurantViewControllerWithId:(NSString *)restaurantId {
    
    YHRestaurantViewController *vc = [[YHRestaurantViewController alloc] init];
    vc.restaurantId = restaurantId;
    return vc;
}

@end
