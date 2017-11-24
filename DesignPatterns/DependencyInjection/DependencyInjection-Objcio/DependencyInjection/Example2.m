//
//  Example.m
//  DependencyInjection
//
//  Created by ShannonChen on 2017/11/24.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Example2.h"

@interface Example2 ()

@property (nonatomic, strong, readonly) NSUserDefaults *userDefaults;

@end

@implementation Example2

- (instancetype)initWithUserDefaults:(NSUserDefaults *)userDefaults {
    self = [super init];
    if (self) {
        _userDefaults = userDefaults;
    }
    return self;
}

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


@end
