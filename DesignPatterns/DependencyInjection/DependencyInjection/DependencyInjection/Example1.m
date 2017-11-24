//
//  Example1.m
//  DependencyInjection
//
//  Created by ShannonChen on 2017/11/24.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Example1.h"

@implementation Example1

- (NSNumber *)nextReminderId {
    
    NSNumber *currentReminderId = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentReminderId"];
    if (currentReminderId) {
        // 增加前一个 reminderId
        currentReminderId = @([currentReminderId intValue] + 1);
    } else {
        // 如果还没有，设为 0
        currentReminderId = @0;
    }
    // 将 currentReminderId 更新到 model 中
    [[NSUserDefaults standardUserDefaults] setObject:currentReminderId forKey:@"currentReminderId"];
    
    return currentReminderId;
}

@end
