//
//  YHRestaurantListViewController.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "YHRestaurantViewController.h"

@interface YHRestaurantViewController ()

@end

@implementation YHRestaurantViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = [NSString stringWithFormat:@"商户详情(%@)", self.restaurantId];
}

@end
