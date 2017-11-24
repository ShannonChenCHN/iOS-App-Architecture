//
//  MetalArmor.m
//  ChainOfResponsibility
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MetalArmor.h"
#import "SwordAttack.h"

@implementation MetalArmor

- (void)handleAttack:(Attack *)attack {
    if ([attack isKindOfClass:[SwordAttack class]]) {
        NSLog(@"%@: No damage from a sword attack!", self.class);
        
    } else {
        NSLog(@"%@: I don't know this %@", self.class, [attack class]);
        
        [super handleAttack:attack];
    }
}

@end
