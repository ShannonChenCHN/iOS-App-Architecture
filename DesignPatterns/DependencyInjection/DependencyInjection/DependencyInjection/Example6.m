//
//  Example6.m
//  DependencyInjection
//
//  Created by ShannonChen on 2017/11/24.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Example6.h"

@implementation Example6


- (NSNumber *)nextReminderId {
    
    NSNumber *currentReminderId = [[self userDefaults] objectForKey:@"currentReminderId"];
    if (currentReminderId) {
        currentReminderId = @([currentReminderId intValue] + 1);
    } else {
        currentReminderId = @0;
    }
    [[self userDefaults] setObject:currentReminderId forKey:@"currentReminderId"];
    
    return currentReminderId;
}

// 将依赖统一放到一个 getter 方法中，方便让子类重写
- (NSUserDefaults *)userDefaults {
    return [NSUserDefaults standardUserDefaults];
}

@end




@implementation TestingExample6

- (NSUserDefaults *)userDefaults {
    
    // 这里可以写任何你想要的结果
    return [NSUserDefaults standardUserDefaults];
}

@end
