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
    
    // 外观模式
    CabDriver *driver = [[CabDriver alloc] init];
    [driver driveToLocation:CGPointMake(100, 100) withCompletion:^(float price) {
        NSLog(@"共计%.2f元", price);
    }];
    
}





@end
