//
//  ConsoleController.m
//  Bridge
//
//  Created by ShannonChen on 2017/11/11.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ConsoleController.h"

@implementation ConsoleController

- (void)setCommand:(ConsoleCommand)command {
    [self.emulator loadInstructionsForCommand:command];
    [self.emulator executeInstructions];
}

@end
