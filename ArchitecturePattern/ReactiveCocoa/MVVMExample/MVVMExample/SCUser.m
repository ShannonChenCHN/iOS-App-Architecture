//
//  SCUser.m
//  MVVMExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCUser.h"

@implementation SCUser


- (id)copyWithZone:(NSZone *)zone {
    SCUser *user = [[SCUser allocWithZone:zone] init];
    user.name = self.name;
    user.password = self.password;
    return user;
}

@end
