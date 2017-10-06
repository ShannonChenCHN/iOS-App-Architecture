//
//  SCBlogTableViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/11.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCBlogTableViewController.h"

#import "SCBlogListAPIManger.h"
#import "SCBlog.h"
#import "SCBlogCellModel.h"

#import "SCBlogTableViewCell.h"

#import <MJRefresh.h>
#import "UIView+HUD.h"

@interface SCBlogTableViewController ()

@property (strong, nonatomic) NSMutableArray <SCBlogCellModel *> *cellModels;
@property (strong, nonatomic) SCBlogListAPIManger *blogAPIManager;

@end

@implementation SCBlogTableViewController

@synthesize eventHandler = _eventHandler;

static NSString * const kCellReuseIdentifier = @"SCBlogCell";

- (instancetype)initWithUserId:(NSString *)userId {
    
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        _userId = userId;
        _cellModels = [NSMutableArray array];
        _blogAPIManager = [[SCBlogListAPIManger alloc] initWithUserId:userId];
        
        
    }
    
    return self;
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    // 注册 cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(SCBlogTableViewCell.class) bundle:nil]
         forCellReuseIdentifier:kCellReuseIdentifier];
    
    // 下拉刷新
    __weak typeof(self) weakSelf = self;
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.tableView.header endRefreshing];
    }];
}
    
    
- (void)fetchDataWithCompletionHandler:(void (^)(NSError *, id))completion {
    
    [self.blogAPIManager startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        
        if (completion) {
            completion(nil, request.responseJSONObject);
        }
        
    } failure:^(YTKBaseRequest *request) {
        
        // 测试数据
        [self.cellModels removeAllObjects];
        for (int i = 0; i < 20; i ++) {
            SCBlog *blog = [[SCBlog alloc] initWithBlogId:[NSString stringWithFormat:@"%i", i]];
            SCBlogCellModel *cellModel = [[SCBlogCellModel alloc] initWithBlog:blog];
            [self.cellModels addObject:cellModel];
        }
        
        [self.tableView reloadData];
        
        if (completion) {
            completion(request.error, nil);
        }
    }];
}


#pragma mark - <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SCBlogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[SCBlogTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellReuseIdentifier];
    }
    
    
    if (indexPath.row < self.cellModels.count) {
        SCBlogCellModel *cellModel = self.cellModels[indexPath.row];
        [cell setBlogTitle:cellModel.titleText];
        [cell setSummaryText:cellModel.summaryText];
        [cell setLikeState:cellModel.isLiked];
        
        __weak typeof(self) weakSelf = self;
        __weak typeof(cell) weakCell = cell;
        cell.eventHandler = ^(NSString *eventId, id params) {
            
            if ([eventId isEqualToString:NSStringFromSelector(@selector(didSelectLikeButton:))]) {
                if (cellModel.isLiked) {
                    [weakSelf showToastWithText:@"你已经赞过它了~"];
                } else {
                    cellModel.isLiked = YES;
                    [weakCell setLikeState:cellModel.isLiked];
                }
            } else {
                if (weakSelf.eventHandler) {
                    weakSelf.eventHandler(eventId, weakSelf.cellModels[indexPath.row].blog);
                }
            }
        };
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.eventHandler) {
        self.eventHandler(NSStringFromSelector(@selector(tableView:didDeselectRowAtIndexPath:)), self.cellModels[indexPath.row].blog);
    }
}

@end
