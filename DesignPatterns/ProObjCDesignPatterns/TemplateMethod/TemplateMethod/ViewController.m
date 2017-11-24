//
//  ViewController.m
//  TemplateMethod
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ViewController.h"
#import "ReubenSandwich.h"
#import "Hamburger.h"
#import "Hotdog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // this method call should throw an exception
//    Sandwich *sandwich = [[Sandwich alloc] init];
//    [sandwich make];
    
    
    ReubenSandwich *reubenSandwich = [[ReubenSandwich alloc] init];
    [reubenSandwich make];
}



@end
