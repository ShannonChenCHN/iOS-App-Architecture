//
//  ViewController.m
//  URLRouter
//
//  Created by ShannonChen on 2018/4/13.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "ViewController.h"
#import "Router.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}
- (IBAction)login:(id)sender {
    
    [[Router shareInstance] openURL:@"yhouse://login" withUserInfo:@{@"completionHandler" : ^(BOOL success) {
        NSLog(@"%@", success ? @"登陆成功" : @"登录失败");
    }}];
}


- (IBAction)didSelectAvatar:(id)sender {
    
    // 相比 target-action 的方式，这种调用方式存在两个问题：
    // 1. 需要有个地方列出各个组件里有什么 URL 接口可供调用
    // 2. 参数的格式不明确，是个灵活的 dictionary，也需要有个地方可以查参数格式
    // 解决方法就是再建一个 RouterManger 再封装一层 API，提供组件 API 的负责维护，使用方直接调用 RouterManger 的 API就可以了
    [[Router shareInstance] openURL:@"yhouse://user" withUserInfo:@{@"userId" : @"4"}];
}


- (IBAction)didSelectViewDetailButton:(id)sender {
    [[Router shareInstance] openURL:@"yhouse://restaurant" withUserInfo:@{@"restaurantId" : @"4"}];
    
}

@end
