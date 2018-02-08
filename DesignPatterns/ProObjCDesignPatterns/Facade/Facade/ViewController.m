//
//  ViewController.m
//  Facade
//
//  Created by ShannonChen on 2017/11/11.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ViewController.h"
#import "CabDriver.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     外观模式：为系统中的一组接口提供一个统一的接口。外观定义一个高层接口，让子系统更易于使用。外观模式本质上就是抽象接口封装，隐藏复杂的细节。比如，对于开车的司机来说，他只需要提供目的地，并且再到达之后知道该花多少钱就行了，具体汽车怎么开过去的，不需要知道。
     
     */
    CabDriver *driver = [[CabDriver alloc] init];
    [driver driveToLocation:CGPointMake(100, 100) withCompletion:^(float price) {
        NSLog(@"共计%.2f元", price);
    }];
    
}





@end
