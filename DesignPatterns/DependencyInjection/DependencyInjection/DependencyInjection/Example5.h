//
//  Example5.h
//  DependencyInjection
//
//  Created by ShannonChen on 2017/11/24.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 环境上下文
 当通过一个类方法 (例如单例) 来访问依赖对象时，在单元测试中可以通过两种方式来控制依赖对象：
 - 如果可以控制单例本身，则可以通过公开其属性来控制其状态。
 - 如果上述方式无效或者所操作的单例不归自己管理，此时就该运用 swizzle 了 —— 直接替换类方法，让其返回你所期望的返回值。
 http://sharpfivesoftware.com/2013/03/20/dependency-injection-is-not-a-virtue-in-objective-c/
 
 */
@interface Article : NSObject

@property (nonatomic, strong) NSDate *publishedAt;

- (void)publish;

@end



/**
 用于测试时的 swizzle
 See DependencyInjectionTests.m
 */
@interface NSDate(dateStub)

+ (instancetype)dateStub;

@end

