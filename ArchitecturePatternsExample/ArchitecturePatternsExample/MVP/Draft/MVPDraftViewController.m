//
//  MVPDraftViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/22.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVPDraftViewController.h"

#import "UIViewController+DZNEmptyDataSet.h"

@interface MVPDraftViewController ()

@property (copy, nonatomic) NSString *userId;

@end

@implementation MVPDraftViewController

- (instancetype)initWithPresenter:(MVPDraftViewPresenter *)presenter {
    
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 空态页
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.tableFooterView = [UIView new];
}
    
- (void)fetchDataWithCompletionHandler:(void (^)(NSError *, id))completion {
    
}

@end
