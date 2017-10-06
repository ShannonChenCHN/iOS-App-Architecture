//
//  SCDraftTableViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/11.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCDraftTableViewController.h"

#import <UIScrollView+EmptyDataSet.h>

@interface SCDraftTableViewController () <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end

@implementation SCDraftTableViewController

@synthesize eventHandler = _eventHandler;

- (instancetype)initWithUserId:(NSString *)userId {
    
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        _userId = userId;
        
    }
    
    return self;
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.tableFooterView = [UIView new];
}
    
- (void)fetchDataWithCompletionHandler:(void (^)(NSError *, id))completion {
    
}
    
#pragma mark - <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
    
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = @"这里空空如也~";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
    
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIColor whiteColor];
}

@end
