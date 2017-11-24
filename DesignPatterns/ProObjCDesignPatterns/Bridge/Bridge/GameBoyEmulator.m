//
//  GameBoyEmulator.m
//  Bridge
//
//  Created by ShannonChen on 2017/11/11.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "GameBoyEmulator.h"

@implementation GameBoyEmulator
    
- (void)loadInstructionsForCommand:(ConsoleCommand)command {
    NSLog(@"GameBoy emulator loadInstructionsForCommand: %@", @(command));
}

- (void)executeInstructions {
    NSLog(@"GameBoy emulator execute instructions");
}

@end
