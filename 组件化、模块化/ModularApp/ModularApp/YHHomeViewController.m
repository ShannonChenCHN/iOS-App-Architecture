//
//  ViewController.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "YHHomeViewController.h"
#import "Mediator.h"
#import "Router.h"

@interface YHHomeViewController ()

@end

@implementation YHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (IBAction)didSelectAvatar:(id)sender {
    
//    UIViewController *vc = [Mediator userViewControllerWithId:@"3"];
//    [self.navigationController pushViewController:vc animated:YES];
    
    // 相比上面的方式，这种调用方式存在两个问题：
    // 1. 需要有个地方列出各个组件里有什么 URL 接口可供调用
    // 2. 参数的格式不明确，是个灵活的 dictionary，也需要有个地方可以查参数格式
    [[Router shareInstance] openURL:@"yhouse://user" withParam:@{@"userId" : @"4"}];
}


- (IBAction)didSelectViewDetailButton:(id)sender {
    UIViewController *vc = [Mediator restaurantViewControllerWithId:@"45"];
    [self.navigationController pushViewController:vc animated:YES];
    
}



@end
