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
#import "UIViewController+DZNEmptyDataSet.h"

@interface MVPBlogViewController () <MVPBlogViewPresenterCallBack>

@property (strong, nonatomic) MVPBlogViewPresenter *presenter;

@end

@implementation MVPBlogViewController

static NSString * const kCellReuseIdentifier = @"MVPBlogCell";

- (instancetype)initWithPresenter:(MVPBlogViewPresenter *)presenter {
    
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        _presenter = presenter;
        _presenter.view = self;  // 将 View 和 Presenter 进行绑定(这里因为 View 是系统的 TableView 无法简单的声明一个 view 属性 所以就绑定到 TableView 的持有者上面)
        
        
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
    [self.tableView reloadData];
    
    
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
    
#pragma mark - <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.presenter.cellPresenters.count;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MVPBlogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[MVPBlogTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellReuseIdentifier];
    }
    
    
    if (indexPath.row < self.presenter.cellPresenters.count) {
        
        MVPBlogCellPresenter *cellPresenter = self.presenter.cellPresenters[indexPath.row];
        cell.presenter = cellPresenter;
        
        // 这里用一个handler是因为点赞失败需要弹框提示, 这个弹框是什么样式或者弹不弹框cell是不知道,
        // 所以把事件传出来在C层处理, 或者你也可以再传到Scene层处理, 这个看具体的业务场景
        __weak typeof(cell) weakCell = cell;
        cell.likeHandler = ^{
            
            //实际的点赞逻辑调用的还是P层实现
            [weakCell.presenter likeBlogWithCompletionHandler:^(NSError *error, id result) {
                !error ?: [weakCell showToastWithText:error.domain];
            }];
  
        };
        
    }
    return cell;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    if (self.eventHandler) {
//        self.eventHandler(NSStringFromSelector(@selector(tableView:didDeselectRowAtIndexPath:)), self.cellModels[indexPath.row].blog);
//    }
}


@end
