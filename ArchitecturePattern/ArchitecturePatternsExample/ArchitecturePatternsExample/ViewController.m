//
//  ViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ViewController.h"
#import "SCUserSelfProfileViewController.h"
#import "MVPUserSelfProfileViewController.h"
#import "MVVMUserSelfProfileViewController.h"

#import "SCUser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

    
- (IBAction)pushMVCExampleForSelfScene:(id)sender {
    [self.navigationController pushViewController:[[SCUserSelfProfileViewController alloc] init] animated:YES];
}
    
- (IBAction)pushMVCExampleForOtherScene:(id)sender {
    [self.navigationController pushViewController:[[SCUserProfileViewController alloc] initWithUserId:@"234"] animated:YES];
}

- (IBAction)pushMVPExampleForSelfScene:(id)sender {
    [self.navigationController pushViewController:[[MVPUserSelfProfileViewController alloc] initWithUserId:@"123"] animated:YES];
}

- (IBAction)pushMVVMExampleForSelfScene:(id)sender {
    [self.navigationController pushViewController:[[MVVMUserSelfProfileViewController alloc] initWithUserId:@"123"] animated:YES];
}


@end
