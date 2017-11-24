//
//  MVVMUserSelfProfileViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVVMUserSelfProfileViewController.h"

#import "MVVMUserInfoViewController.h"
#import "MVVMBlogViewController.h"
#import "MVVMDraftViewController.h"
#import "SCUserDetailViewController.h"
#import "SCBlogDetailViewController.h"

#import "UIView+SCLayout.h"
#import "UIView+HUD.h"

#import <ReactiveCocoa.h>

@interface MVVMUserSelfProfileViewController ()

    
@property (copy, nonatomic) NSString *userId;

@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) MVVMUserInfoViewController *userInfoController;
@property (strong, nonatomic) MVVMBlogViewController *blogController;
@property (strong, nonatomic) MVVMDraftViewController *draftController;


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
    
    @weakify(self);
    
    // 用户信息
    MVVMUserInfoViewModel *userInfoViewModel = [[MVVMUserInfoViewModel alloc] initWithUserId:self.userId];
    self.userInfoController = [[MVVMUserInfoViewController alloc] initWithViewModel:userInfoViewModel];
    self.userInfoController.avatarSelectedCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(SCUser *user) {
        @strongify(self);
        
        SCUserDetailViewController *controller = [[SCUserDetailViewController alloc] initWithUser:user];
        [self.navigationController pushViewController:controller animated:YES];
        
        return [RACSignal empty];
    }];
    
    // 博客列表
    MVVMBlogViewModel *blogViewModel = [[MVVMBlogViewModel alloc] initWithUserId:self.userId];
    self.blogController = [[MVVMBlogViewController alloc] initWithViewModel:blogViewModel];
    self.blogController.tableViewRowSelectedCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(SCBlog *blog) {
        SCBlogDetailViewController *controller = [[SCBlogDetailViewController alloc] initWithBlog:blog];
        [self.navigationController pushViewController:controller animated:YES];
        
        return [RACSignal empty];
    }];
    
    
    // 草稿箱
    MVVMDraftViewModel *draftViewModel = [[MVVMDraftViewModel alloc] initWithUserId:self.userId];
    self.draftController = [[MVVMDraftViewController alloc] initWithViewModel:draftViewModel];
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
    
    [[self.userInfoController.viewModel.userInfoFetchingCommand execute:nil] subscribeError:^(NSError *error) {
        [self showToastWithText:@"用户信息获取失败！"];
    }];
    
    
    [self showHUD]; // HUD 展示交给上层处理
    [[self.blogController.dataFetchingCommand execute:nil] subscribeError:^(NSError *error) {
        [self hideHUD];
        [self showToastWithText:@"博客数据获取失败！"];
    } completed:^{
        [self hideHUD];
    }];
    
//
//    [self.draftController fetchDataWithCompletionHandler:nil];
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
