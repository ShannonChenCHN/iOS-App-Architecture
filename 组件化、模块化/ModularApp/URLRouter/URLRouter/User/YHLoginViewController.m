//
//  YHLoginViewController.m
//  URLRouter
//
//  Created by ShannonChen on 2018/4/13.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "YHLoginViewController.h"

@interface YHLoginViewController ()

@end

@implementation YHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"登录";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismiss)];
    self.view.backgroundColor = [UIColor whiteColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.completionHandler) {
            self.completionHandler(YES);
        }
    });
}

- (void)dismiss {
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}

@end
