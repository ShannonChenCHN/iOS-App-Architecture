//
//  SCUserProfileViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCUserProfileViewController_Private.h"
#import "SCUserDetailViewController.h"
#import "SCBlogDetailViewController.h"

@interface SCUserProfileViewController ()
    

@end

@implementation SCUserProfileViewController
    
    
- (instancetype)initWithUserId:(NSString *)userId {
    if (self = [super init]) {
        _userId = userId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.title = [NSString stringWithFormat:@"用户 %@", self.userId];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self setupControllers];
    
    
    [self setupViews];
    
    
    [self setupModels];
    
}
    

    
- (void)setupControllers {
    
    self.userInfoController = [[SCUserInfoViewController alloc] initWithUserId:self.userId];
    
    self.blogController = [[SCBlogTableViewController alloc] initWithUserId:self.userId];
}
    
    
- (void)setupViews {
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    __weak typeof(self) weakSelf = self;
    
    // 用户信息
    {
        self.userInfoController.view.frame = CGRectMake(0, 0, self.view.width, 160);
        self.userInfoController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:self.userInfoController.view];
        
        // 事件的处理
        self.userInfoController.eventHandler = ^(NSString *eventId, id params) {
            if ([eventId isEqualToString:NSStringFromSelector(@selector(didSelectUserAvatar:))]) {
                SCUserDetailViewController *controller = [[SCUserDetailViewController alloc] initWithUser:params];
                [weakSelf.navigationController pushViewController:controller animated:YES];
            }
            
        };
    }
    
    // 博客列表
    {
        self.blogController.view.frame = CGRectMake(0, self.userInfoController.view.bottom, self.view.width, self.view.height - self.userInfoController.view.height - 64);
        self.blogController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:self.blogController.view];
        
        self.blogController.eventHandler = ^(NSString *eventId, id params) {
            if ([eventId isEqualToString:NSStringFromSelector(@selector(tableView:didDeselectRowAtIndexPath:))]) {
                SCBlogDetailViewController *controller = [[SCBlogDetailViewController alloc] initWithBlog:params];
                [weakSelf.navigationController pushViewController:controller animated:YES];
            } else {
                
            }
        };
    }
}

- (void)setupModels {
    [self.userInfoController fetchDataWithCompletionHandler:nil];
    
    
    [self showHUD];
    [self.blogController fetchDataWithCompletionHandler:^(NSError *error, id result) {
        [self hideHUD];
    }];
}


@end
