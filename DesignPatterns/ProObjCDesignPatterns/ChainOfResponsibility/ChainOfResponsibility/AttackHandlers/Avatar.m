//
//  Avatar.m
//  ChainOfResponsibility
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Avatar.h"

@implementation Avatar

- (void)handleAttack:(Attack *)attack {
    NSLog(@"Avatar: oh! I'm hit with a %@", [attack class]);
}

@end
