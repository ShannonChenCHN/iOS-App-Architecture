//
//  CrystalShield.m
//  ChainOfResponsibility
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "CrystalShield.h"
#import "MagicFireAttack.h"

@implementation CrystalShield

- (void)handleAttack:(Attack *)attack {
    if ([attack isKindOfClass:[MagicFireAttack class]]) {
        NSLog(@"%@: No damage from a magic fire attack!", self.class);
    } else {
        NSLog(@"%@: I don't know this %@", self.class, [attack class]);
        [super handleAttack:attack];
    }
}

@end
