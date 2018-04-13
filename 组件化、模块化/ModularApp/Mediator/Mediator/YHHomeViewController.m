//
//  ViewController.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "YHHomeViewController.h"
#import "Mediator.h"

@interface YHHomeViewController ()

@end

@implementation YHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (IBAction)didSelectAvatar:(id)sender {
    
    UIViewController *vc = [Mediator userViewControllerWithId:@"3"];
    [self.navigationController pushViewController:vc animated:YES];

}


- (IBAction)didSelectViewDetailButton:(id)sender {
    UIViewController *vc = [Mediator restaurantViewControllerWithId:@"45"];
    [self.navigationController pushViewController:vc animated:YES];
    
}



@end
