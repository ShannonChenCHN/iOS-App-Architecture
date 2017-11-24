//
//  ConsoleController.h
//  Bridge
//
//  Created by ShannonChen on 2017/11/11.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsoleEmulator.h"

/**
 虚拟控制器
 */
@interface ConsoleController : NSObject
    
@property (nonatomic, strong) ConsoleEmulator *emulator;
    
// 让子类调用的
- (void)setCommand:(ConsoleCommand)command;

@end
