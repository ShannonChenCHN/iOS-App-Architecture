//
//  Example3.m
//  DependencyInjection
//
//  Created by ShannonChen on 2017/11/24.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Example3.h"

@implementation Example3

- (NSNumber *)nextReminderId {
    
    NSNumber *currentReminderId = [self.userDefaults objectForKey:@"currentReminderId"];
    if (currentReminderId) {
        currentReminderId = @([currentReminderId intValue] + 1);
    } else {
        currentReminderId = @0;
    }
    [self.userDefaults setObject:currentReminderId forKey:@"currentReminderId"];
    
    return currentReminderId;
}

- (NSUserDefaults *)userDefaults {
    if (!_userDefaults) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return _userDefaults;
}

@end
