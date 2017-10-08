//
//  MVVMBlogViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVVMBlogViewController.h"
#import "UIViewController+DZNEmptyDataSet.h"
#import <MJRefresh.h>

#import "MVVMBlogCell.h"


static NSString * const kCellReuseIdentifier = @"MVVMBlogCell";


@interface MVVMBlogViewController ()

@property (strong, nonatomic, readwrite) RACCommand *dataFetchingCommand;

@end

@implementation MVVMBlogViewController

- (instancetype)initWithViewModel:(MVVMBlogViewModel *)viewModel {
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        
        _viewModel = viewModel;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 空态页
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.tableFooterView = [UIView new];
    
    // 注册 cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(MVVMBlogCell.class) bundle:nil]
         forCellReuseIdentifier:kCellReuseIdentifier];
    
    
    @weakify(self);
    
    // 首次请求数据
    self.dataFetchingCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        
        RACSubject *subject = [RACSubject subject];
        [self.viewModel.refreshDataSignal subscribeError:^(NSError *error) {
            
            [subject sendError:error];
        } completed:^{
            
            [self.tableView reloadData];
            [subject sendCompleted];
        }];
        
        return subject;
    }];
    
    // 下拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        
        [self.viewModel.refreshDataSignal subscribeError:^(NSError *error) {
            
            [self.tableView.header endRefreshing];
            
        } completed:^{
            
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
            [self.tableView.footer resetNoMoreData];
        }];
    }];
    
}

#pragma mark - <UITableViewDelegate, UITableViewDataSource>
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.cellModels.count;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MVVMBlogCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier];
    
    if (indexPath.row < self.viewModel.cellModels.count) {
        
        MVVMBlogCellModel *cellModel = self.viewModel.cellModels[indexPath.row];
        cell.cellModel = cellModel;
    }
    return cell;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.tableViewRowSelectedCommand execute:self.viewModel.cellModels[indexPath.row].blog];
}

@end
