//
//  Mediator.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "Mediator.h"

//#import "YHModuleCommunity.h"
//#import "YHModuleReservation.h"
//#import "YHModuleUser.h"

@implementation Mediator

+ (UIViewController *)eventDetailViewControllerWithId:(NSString *)eventId {
//    return [YHModuleCommunity eventDetailViewControllerWithId:eventId];
    
    // 通过 runtime 的方式来避免 Mediator 对各组件的依赖
    Class class = NSClassFromString(@"YHModuleCommunity");
    SEL selector = NSSelectorFromString(@"eventDetailViewControllerWithId:");
    return [class performSelector:selector withObject:eventId];
}


+ (UIViewController *)restaurantViewControllerWithId:(NSString *)restaurantId {
//    return [YHModuleReservation restaurantViewControllerWithId:restaurantId];
    
    Class class = NSClassFromString(@"YHModuleReservation");
    SEL selector = NSSelectorFromString(@"restaurantViewControllerWithId:");
    return [class performSelector:selector withObject:restaurantId];
    
}

+ (UIViewController *)userViewControllerWithId:(NSString *)userId {
//    return [YHModuleUser userViewControllerWithId:userId];
    
    Class class = NSClassFromString(@"YHModuleUser");
    SEL selector = NSSelectorFromString(@"userViewControllerWithId:");
    return [class performSelector:selector withObject:userId];
}

@end

