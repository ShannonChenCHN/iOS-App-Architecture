//
//  MVVMDraftViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVVMDraftViewController.h"
#import "UIViewController+DZNEmptyDataSet.h"

@interface MVVMDraftViewController ()

@property (strong, nonatomic) MVVMDraftViewModel *viewModel;

@end

@implementation MVVMDraftViewController

- (instancetype)initWithViewModel:(MVVMDraftViewModel *)viewModel {
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
}

@end
