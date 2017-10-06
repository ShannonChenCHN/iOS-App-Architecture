//
//  MVPUserSelfProfileViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/22.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVPUserSelfProfileViewController.h"

#import "MVPBlogViewController.h"
#import "MVPDraftViewController.h"
#import "SCUserInfoViewController.h"
#import "SCUserDetailViewController.h"
#import "SCBlogDetailViewController.h"

#import "UIView+SCLayout.h"
#import "UIView+HUD.h"

@interface MVPUserSelfProfileViewController ()

@property (copy, nonatomic) NSString *userId;

@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) SCUserInfoViewController *userInfoController;
@property (strong, nonatomic) MVPBlogViewController *blogController;
@property (strong, nonatomic) MVPDraftViewController *draftController;


@end

@implementation MVPUserSelfProfileViewController


- (instancetype)initWithUserId:(NSString *)userId {
    if (self = [super init]) {
        _userId = userId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.title = @"我";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self setupControllers];
    
    
    [self setupViews];
    
    
    [self setupModels];
    
}



- (void)setupControllers {
    
    self.userInfoController = [[SCUserInfoViewController alloc] initWithUserId:self.userId];
    
    self.blogController = [[MVPBlogViewController alloc] initWithPresenter:[[MVPBlogViewPresenter alloc] initWithUserId:self.userId]];
    
    self.draftController = [[MVPDraftViewController alloc] initWithUserId:self.userId];
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
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"博客", @"草稿"]];
    self.segmentedControl.frame = CGRectMake(0, self.userInfoController.view.bottom + 5, 200, 30);
    self.segmentedControl.centerX = self.view.centerX;
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentedControl addTarget:self action:@selector(switchTableView:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];
    
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.segmentedControl.bottom + 5, self.view.width, self.view.height - self.segmentedControl.bottom - 64)];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.contentSize = CGSizeMake(self.view.width * 2, 0);
    self.scrollView.scrollEnabled = NO;
    [self.view addSubview:self.scrollView];
    
    // 博客列表
    {
        self.blogController.tableView.frame = CGRectMake(0, 0, self.scrollView.width, self.scrollView.height);
        self.blogController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.scrollView addSubview:self.blogController.tableView];
        
//        self.blogController.eventHandler = ^(NSString *eventId, id params) {
//            if ([eventId isEqualToString:NSStringFromSelector(@selector(tableView:didDeselectRowAtIndexPath:))]) {
//                SCBlogDetailViewController *controller = [[SCBlogDetailViewController alloc] initWithBlog:params];
//                [weakSelf.navigationController pushViewController:controller animated:YES];
//            } else {
//                
//            }
//        };
    }
    
    // 草稿列表
    {
        
        self.draftController.tableView.frame = CGRectMake(self.view.width, 0, self.view.width, self.scrollView.height);
        self.draftController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.scrollView addSubview:self.draftController.tableView];
    }
}

- (void)setupModels {
    [self.userInfoController fetchDataWithCompletionHandler:nil];
    
    
    [self showHUD];
    [self.blogController.presenter fetchDataWithCompletionHandler:^(NSError *error, id result) {
        [self hideHUD];
    }];
}




@end
