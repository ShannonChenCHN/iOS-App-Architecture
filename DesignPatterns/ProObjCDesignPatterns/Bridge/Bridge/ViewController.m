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
    
    /*
     桥接模式要达到的目的是：将抽象部分跟实现部分进行分离，使它们都可以独立改变。
     好处在于，只要定义好了抽象层和实现层的抽象父类，实体子类都可以在内部定义任何的实现。
     
     如何实现：抽象层定义供 client 使用的上层抽象接口，实现层定义了供抽象层使用的底层接口，
             实现类的引用被封装于抽象层的实例中，桥接就实现了。
     
     */
    
    /**
     
     这个例子中， TouchConsoleController 的父类 ConsoleController 作为抽象类，定义了供 client 使用的抽象接口：`-setCommand:`，它有一个对实现层 ConsoleEmulator 实例的引用，
     ConsoleEmulator 定义了实现层的接口。ConsoleEmulator 的接口提供基本操作，ConsoleController
     的上层操作基于这些操作。当客户端向 TouchConsoleController 实例发送 up 消息时，会调用父类的 `-setCommand:`
     方法，该方法会向其属性 emulator，也就是实现层，发送相应的消息。
     
     **/
    
    // 仿真器
//    GameBoyEmulator *emulator1 = [[GameBoyEmulator alloc] init];
    GameGearEmulator *emulator2 = [[GameGearEmulator alloc] init];
    
    // 控制器
    TouchConsoleController *console = [[TouchConsoleController alloc] init];
    console.emulator = emulator2;
    
    [console up]; // 执行向上的操作
    
}



@end
