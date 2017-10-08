//
//  MVVMUserSelfProfileViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVVMUserSelfProfileViewController.h"

#import "UIView+SCLayout.h"
#import "UIView+HUD.h"

@interface MVVMUserSelfProfileViewController ()

    
@property (copy, nonatomic) NSString *userId;

@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) SCUserInfoViewController *userInfoController;
@property (strong, nonatomic) MVPBlogViewController *blogController;
@property (strong, nonatomic) MVPDraftViewController *draftController;


@end

@implementation MVVMUserSelfProfileViewController

    
    
#pragma mark - Life Cycle
    
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
    
#pragma mark - Setup
    
- (void)setupControllers {
    
    __weak typeof(self) weakSelf = self;
    
    // 用户信息
    self.userInfoController = [[SCUserInfoViewController alloc] initWithUserId:self.userId]; // 这个 userInfo 部分用的还是 MVC
    
    self.userInfoController.eventHandler = ^(NSString *eventId, id params) {
        if ([eventId isEqualToString:NSStringFromSelector(@selector(didSelectUserAvatar:))]) {
            SCUserDetailViewController *controller = [[SCUserDetailViewController alloc] initWithUser:params];
            [weakSelf.navigationController pushViewController:controller animated:YES];
        }
        
    };
    
    /**
     MVP 中的 P 和 V 是相互独立的逻辑，所以 P-V 中两者都是可以更换的，如果是基于 protocol 来实现的话，就更加解耦了
     标准的 MVP 中，理论上，每个数据 Model 对应一个 View 层和一个 Presenter 层，以及 Controller 层：
     - V 只负责展示
     - P 专门负责数据转换直接提供给 V，以及处理业务逻辑
     - C 只负责处理大场景的逻辑，与上层进行交互，比如展示网路加载等待时的 HUD，另外就是子 View 的布局和子 P-V 的绑定
     
     */
    
    // 博客列表
    MVPBlogViewPresenter *blogPresenter = [[MVPBlogViewPresenter alloc] initWithUserId:self.userId];
    self.blogController = [[MVPBlogViewController alloc] initWithPresenter:blogPresenter];
    
    self.blogController.eventHandler = ^(NSString *eventId, id params) {  // 页面跳转逻辑交给上层处理
        
        if ([eventId isEqualToString:NSStringFromSelector(@selector(tableView:didDeselectRowAtIndexPath:))]) {
            SCBlogDetailViewController *controller = [[SCBlogDetailViewController alloc] initWithBlog:params];
            [weakSelf.navigationController pushViewController:controller animated:YES];
        } else {
            
        }
    };
    
    // 草稿箱
    MVPDraftViewPresenter *draftPresenter = [[MVPDraftViewPresenter alloc] initWithUserId:self.userId];
    self.draftController = [[MVPDraftViewController alloc] initWithPresenter:draftPresenter];
}
    
    
- (void)setupViews {
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    // 用户信息
    {
        self.userInfoController.view.frame = CGRectMake(0, 0, self.view.width, 160);
        self.userInfoController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:self.userInfoController.view];
    }
    
    // 切换 tab
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"博客", @"草稿"]];
    self.segmentedControl.frame = CGRectMake(0, self.userInfoController.view.bottom + 5, 200, 30);
    self.segmentedControl.centerX = self.view.centerX;
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentedControl addTarget:self action:@selector(switchTableView:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];
    
    
    // scroll view
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.segmentedControl.bottom + 5, self.view.width, self.view.height - self.segmentedControl.bottom)];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.contentSize = CGSizeMake(self.view.width * 2, 0);
    self.scrollView.scrollEnabled = NO;
    [self.view addSubview:self.scrollView];
    
    // 博客列表
    {
        self.blogController.tableView.frame = CGRectMake(0, 0, self.scrollView.width, self.scrollView.height);
        self.blogController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.scrollView addSubview:self.blogController.tableView];
        
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
    
    
    [self showHUD]; // HUD 展示交给上层处理
    [self.blogController.presenter fetchDataWithCompletionHandler:^(NSError *error, id result) {
        [self hideHUD];
    }];
    
    [self.draftController fetchDataWithCompletionHandler:nil];
}
    
    
#pragma mark - Action
    
- (void)switchTableView:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        
        [self.scrollView setContentOffset:CGPointZero animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(self.view.width, 0) animated:YES];
    }
}

@end
