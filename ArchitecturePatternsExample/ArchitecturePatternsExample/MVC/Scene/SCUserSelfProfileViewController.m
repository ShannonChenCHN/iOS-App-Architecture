//
//  SCUserSelfProfileViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCUserSelfProfileViewController.h"
#import "SCUserProfileViewController_Private.h"

#import "SCDraftTableViewController.h"

#import "UIView+SCLayout.h"

#import "SCUser.h"

@interface SCUserSelfProfileViewController ()

@property (strong, nonatomic) SCDraftTableViewController *draftController;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation SCUserSelfProfileViewController
    
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.userId = kCurrentUserId;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我";
    
}

- (void)setupViews {
    [super setupViews];
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"博客", @"草稿"]];
    self.segmentedControl.frame = CGRectMake(0, self.userInfoController.view.bottom + 5, 200, 30);
    self.segmentedControl.centerX = self.view.centerX;
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentedControl addTarget:self action:@selector(switchTableView:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];
    
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.segmentedControl.bottom + 5, self.view.width, self.view.height - self.segmentedControl.bottom - 64)];
    self.scrollView.contentSize = CGSizeMake(self.view.width * 2, 0);
    self.scrollView.scrollEnabled = NO;
    [self.view addSubview:self.scrollView];
    
    self.blogController.tableView.frame = CGRectMake(0, 0, self.view.width, self.scrollView.height);
    [self.scrollView addSubview:self.blogController.tableView];
    
    self.draftController.tableView.frame = CGRectMake(self.view.width, 0, self.view.width, self.scrollView.height);
    [self.scrollView addSubview:self.draftController.tableView];
}

- (void)setupModels {
    [super setupModels];
    
    [self.draftController fetchDataWithCompletionHandler:^(NSError *error, id result) {
        
    }];
}

- (void)setupControllers {
    [super setupControllers];
    
    self.draftController = [[SCDraftTableViewController alloc] initWithUserId:self.userId];

}

- (void)switchTableView:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        
        [self.scrollView setContentOffset:CGPointZero animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(self.view.width, 0) animated:YES];
    }
}


@end
