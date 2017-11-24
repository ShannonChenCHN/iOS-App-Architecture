//
//  AttackHandler.m
//  ChainOfResponsibility
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "AttackHandler.h"

@implementation AttackHandler

- (void)handleAttack:(Attack *)attack {
    [self.nextAttackHandler handleAttack:attack];
}

@end
