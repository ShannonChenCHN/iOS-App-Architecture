//
//  YHModuleCommunity.h
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>

// 其实这里各组件类 YHModule 的作用是提供该组件各个类的公开 API

/**
 社区模块
 */
@interface YHModuleCommunity : NSObject

+ (UIViewController *)eventDetailViewControllerWithId:(NSString *)eventId;
+ (UIViewController *)eventListViewController;

@end
