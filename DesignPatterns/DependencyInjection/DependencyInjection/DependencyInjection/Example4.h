//
//  Example4.h
//  DependencyInjection
//
//  Created by ShannonChen on 2017/11/24.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 方法注入：如果依赖对象只在某一个方法中被使用，则可以利用方法参数做注入
 */
@interface Example4 : NSObject

- (NSNumber *)nextReminderIdWithUserDefaults:(NSUserDefaults *)userDefaults;

@end
