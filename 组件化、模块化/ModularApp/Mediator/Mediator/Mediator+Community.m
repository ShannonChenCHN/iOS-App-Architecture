//
//  Mediator+Community.m
//  Mediator
//
//  Created by ShannonChen on 2018/4/13.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "Mediator+Community.h"

@implementation Mediator (Community)

// 经过优化后，各组件的 API 都放在 category 中了，将 runtime 的代码封装了一层
+ (UIViewController *)eventDetailViewControllerWithId:(NSString *)eventId {

    return [self performAction:@"eventDetailViewControllerWithId:" withTarget:@"YHModuleCommunity" userInfo:eventId];
}


+ (UIViewController *)eventListViewController {
    
    return [self performAction:@"eventListViewController:" withTarget:@"YHModuleCommunity" userInfo:nil];
}

@end
