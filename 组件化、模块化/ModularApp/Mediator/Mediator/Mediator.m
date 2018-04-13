//
//  Mediator.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "Mediator.h"


// 这里对各组件产生了依赖，类越来越多，文件越来越大，所以可以像 casa 的方案那样采用 runtime 的方式来优化
// 但是这样的话就会产生更多的 hardcode。减少依赖的另一个好处在于组件化开发时，在开发一个组件不会因为 Mediator 而间接依赖了另一个组件
//#import "YHModuleCommunity.h"
//#import "YHModuleReservation.h"
//#import "YHModuleUser.h"

@implementation Mediator

+ (UIViewController *)restaurantViewControllerWithId:(NSString *)restaurantId {
//    return [YHModuleReservation restaurantViewControllerWithId:restaurantId];
    
    // 通过 runtime 的方式来避免 Mediator 对各组件的依赖
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



// 经过优化后，各组件的 API 都放在 category 中去了
+ (id)performAction:(NSString *)action withTarget:(NSString *)targetName userInfo:(id)userInfo {
    Class class = NSClassFromString(targetName);
    SEL selector = NSSelectorFromString(action);
    return [class performSelector:selector withObject:userInfo];
}

@end

