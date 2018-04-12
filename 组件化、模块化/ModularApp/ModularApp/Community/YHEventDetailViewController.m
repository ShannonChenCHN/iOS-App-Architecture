//
//  YHEventDetailViewController.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "YHEventDetailViewController.h"

@interface YHEventDetailViewController ()

@end

@implementation YHEventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = [NSString stringWithFormat:@"活动详情(%@)", self.eventId];
}


@end
