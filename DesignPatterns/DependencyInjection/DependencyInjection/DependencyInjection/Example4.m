//
//  Example4.m
//  DependencyInjection
//
//  Created by ShannonChen on 2017/11/24.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Example4.h"

@implementation Example4

- (NSNumber *)nextReminderIdWithUserDefaults:(NSUserDefaults *)userDefaults {
    NSNumber *currentReminderId = [userDefaults objectForKey:@"currentReminderId"];
    if (currentReminderId) {
        currentReminderId = @([currentReminderId intValue] + 1);
    } else {
        currentReminderId = @0;
    }
    [userDefaults setObject:currentReminderId forKey:@"currentReminderId"];
    return currentReminderId;
}

@end
