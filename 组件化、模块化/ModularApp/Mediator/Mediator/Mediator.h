//
//  Mediator.h
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 
 问题：
 1. Mediator 怎么去转发组件间调用？
 2. 一个模块只跟 Mediator 通信，怎么知道另一个模块提供了什么接口？
 3. 模块和 Mediator 间互相依赖，怎样破除这个依赖？
 
 解决办法
 在 Mediator 直接提供接口，调用对应模块的方法；各模块再提供接口给 Mediator。通过这样可以解决前两个问题。
 通过 runtime 的 performSelector: 方式来调用个组件的接口，可以避免 Mediator 对 个模块的依赖。（but 但是这样的话就会产生更多的 hardcode）
 
 待优化点：
 1. Mediator 每一个方法里都要写 runtime 方法，格式是确定的，这是可以抽取出来的。
 2. 每个组件对外方法都要在 Mediator 写一遍，组件一多 Mediator 类的长度是恐怖的。
 
 解决办法：
 1. target-action
 2. category
 
 
 */

@interface Mediator : NSObject

+ (UIViewController *)restaurantViewControllerWithId:(NSString *)restaurantId;
+ (UIViewController *)userViewControllerWithId:(NSString *)userId;

+ (id)performAction:(NSString *)action withTarget:(NSString *)targetName userInfo:(id)userInfo;

@end
