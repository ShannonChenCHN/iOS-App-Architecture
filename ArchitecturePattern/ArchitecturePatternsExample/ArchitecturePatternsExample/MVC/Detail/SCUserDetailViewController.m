//
//  SCUserDetailViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCUserDetailViewController.h"
#import "SCUser.h"

@interface SCUserDetailViewController ()

@property (strong, nonatomic) SCUser *user;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation SCUserDetailViewController

- (instancetype)initWithUser:(SCUser *)user {
    
    if (self = [super init]) {
        _user = user;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = self.user.name;
}


@end
