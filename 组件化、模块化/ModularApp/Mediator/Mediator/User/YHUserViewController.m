//
//  YHUserViewController.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "YHUserViewController.h"

@interface YHUserViewController ()

@end

@implementation YHUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = [NSString stringWithFormat:@"用户详情(%@)", self.userId];
}

@end
