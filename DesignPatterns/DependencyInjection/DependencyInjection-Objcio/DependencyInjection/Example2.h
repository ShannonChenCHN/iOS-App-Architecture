//
//  Example.h
//  DependencyInjection
//
//  Created by ShannonChen on 2017/11/24.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 构造器注入：将某个依赖对象传入到构造器中 (在 Objective- C中指 designated 初始化方法)并存储起来，以便在后续过程中使用
 */
@interface Example2 : NSObject

// 注：其实在这里被注入的更应该是一个抽象类型的对象 (像 id 这种) 来作为依赖可能会比指定某个具体类型要更好一些
- (instancetype)initWithUserDefaults:(NSUserDefaults *)userDefaults;

- (NSNumber *)nextReminderId;

@end
