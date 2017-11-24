//
//  GameGearEmulator.m
//  Bridge
//
//  Created by ShannonChen on 2017/11/11.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "GameGearEmulator.h"

@implementation GameGearEmulator

- (void)loadInstructionsForCommand:(ConsoleCommand)command {
    NSLog(@"GameGear emulator loadInstructionsForCommand: %@", @(command));
}
    
- (void)executeInstructions {
    NSLog(@"GameGear emulator execute instructions");
}
    
@end
