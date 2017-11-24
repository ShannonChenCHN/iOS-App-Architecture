//
//  SCUserProfileViewController_Private.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCUserProfileViewController.h"

#import "SCBlogTableViewController.h"
#import "SCUserInfoViewController.h"

#import "UIView+SCLayout.h"
#import "UIView+HUD.h"

@interface SCUserProfileViewController ()

@property (copy, nonatomic) NSString *userId;

@property (strong, nonatomic) SCUserInfoViewController *userInfoController;
@property (strong, nonatomic) SCBlogTableViewController *blogController;

- (void)setupControllers;
- (void)setupViews;
- (void)setupModels;

@end
