//
//  ViewController.m
//  ProtocolProgrammingDemo
//
//  Created by haijiao on 15/12/20.
//  Copyright © 2015年 olinone. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+ApiServiceProtocol.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onGetRequestBtnClick:(id)sender {
    
    // 调用方使用抽象接口而非对象，以接口依赖的方式取代对象依赖，来达到解耦的目的
    [self requestGetNetWithUrl:[NSURL URLWithString:@"www.olinone.com"] Param:nil];
}

- (IBAction)onPostRequestBtnClick:(id)sender {
    [self requestPostNetWithUrl:[NSURL URLWithString:@"www.shenmaip.com"] Param:nil];
}

@end
