//
//  ConsoleEmulator.h
//  Bridge
//
//  Created by ShannonChen on 2017/11/11.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsoleCommands.h"


/**
 仿真机抽象基类
 */
@interface ConsoleEmulator : NSObject
    
- (void)loadInstructionsForCommand:(ConsoleCommand)command;
- (void)executeInstructions;

@end
