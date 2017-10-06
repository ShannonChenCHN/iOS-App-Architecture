//
//  SCUser.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCUser.h"

@implementation SCUser

- (instancetype)initWithUserId:(NSString *)userId {
    
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"user%@", userId];
        self.avartarURLString = @"";
        self.userId = userId;
        self.summary = [NSString stringWithFormat:@"userSummary%@", userId];
        self.blogCount = 23;
        self.friendCount = 34;
    }
    
    return self;
}

@end
