//
//  AttackHandler.h
//  ChainOfResponsibility
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Attack.h"


/**
 AttackHandler 抽象基类
 */
@interface AttackHandler : NSObject

@property (strong, nonatomic) AttackHandler *nextAttackHandler; ///< 下一个防御者

- (void)handleAttack:(Attack *)attack;

@end
