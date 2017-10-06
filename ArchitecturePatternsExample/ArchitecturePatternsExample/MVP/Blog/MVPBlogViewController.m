//
//  MVPBlogViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/22.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVPBlogViewController.h"

#import "MVPBlogTableViewCell.h"

#import <MJRefresh.h>
#import "UIView+HUD.h"

@interface MVPBlogViewController () <MVPBlogViewPresenterCallBack>

@property (strong, nonatomic) MVPBlogViewPresenter *presenter;

@end

@implementation MVPBlogViewController

static NSString * const kCellReuseIdentifier = @"SCBlogCell";

- (instancetype)initWithPresenter:(MVPBlogViewPresenter *)presenter {
    
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        _presenter = presenter;
        _presenter.view = self;  // //将 View 和 Presenter 进行绑定(这里因为 View 是系统的 TableView 无法简单的声明一个 view 属性 所以就绑定到 TableView 的持有者上面)
        
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册 cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(MVPBlogTableViewCell.class) bundle:nil]
         forCellReuseIdentifier:kCellReuseIdentifier];
    
    // 下拉刷新
    __weak typeof(self) weakSelf = self;
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.presenter refreshData];
    }];
   
}


#pragma mark - BlogViewPresenterCallBack

- (void)blogViewPresenter:(MVPBlogViewPresenter *)presenter didRefreshDataWithResult:(id)result error:(NSError *)error {
    [self.tableView.header endRefreshing];
    
    if (!error) {
        
        [self.tableView reloadData];
        [self.tableView.footer resetNoMoreData];
        
    } else if (self.presenter.cellPresenters.count == 0) {
        //        show error view
    }
}

- (void)blogViewPresenter:(MVPBlogViewPresenter *)presenter didLoadMoreDataWithResult:(id)result error:(NSError *)error {
    [self.tableView.footer endRefreshing];
    
    if (!error) {
        [self.tableView reloadData];
    } else {
        
        [self.tableView showToastWithText:error.domain];
        [self.tableView.footer endRefreshingWithNoMoreData];
    }
}


@end
