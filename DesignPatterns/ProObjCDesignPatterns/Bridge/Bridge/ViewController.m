//
//  ViewController.m
//  Bridge
//
//  Created by ShannonChen on 2017/11/11.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ViewController.h"
#import "TouchConsoleController.h"
#import "GameBoyEmulator.h"
#import "GameGearEmulator.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 仿真器
//    GameBoyEmulator *emulator1 = [[GameBoyEmulator alloc] init];
    GameGearEmulator *emulator2 = [[GameGearEmulator alloc] init];
    
    // 控制器
    TouchConsoleController *console = [[TouchConsoleController alloc] init];
    console.emulator = emulator2;
    
    [console up]; // 执行向上的操作
    
}



@end
