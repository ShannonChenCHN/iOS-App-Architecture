//
//  SCTableViewController.m
//  Example
//
//  Created by ShannonChen on 2017/8/4.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCTableViewController.h"
#import "SCTableView.h"
#import "SCTableViewDataSource.h"

@interface SCTableViewController () <SCTableViewDelegate>

@property (strong, nonatomic) SCTableView *tableView;
@property (strong, nonatomic) SCTableViewDataSource *dataSource;

@end

@implementation SCTableViewController


/***
 
 TODO：
 1. 实际案例的使用
 2. 扩展功能
 3. 推广到 UICollectionView
 
 **/

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建数据源
    self.dataSource = [[SCTableViewDataSource alloc] init];
    
    // 列表
    self.tableView = [[SCTableView alloc] initWithFrame:self.view.bounds];
    self.tableView.customDataSource = self.dataSource;
    self.tableView.customDelegate = self;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    
    
    // 更新数据
    NSMutableArray *sections = [NSMutableArray array];
    for (int section = 0; section < 4; section++) {
        
        SCTableViewSectionModel *sectionModel = [[SCTableViewSectionModel alloc] init];
        
        NSMutableArray *rows = [NSMutableArray array];
        for (int row = 0; row < 10; row++) {
            
            SCTableViewCellModel *cellModel = [[SCTableViewCellModel alloc] init];
            cellModel.title = [NSString stringWithFormat:@"%i - %i", section, row];
            
            [rows addObject:cellModel];
        }
        
        sectionModel.cellModels = rows;
        [sections addObject:sectionModel];
    }
    self.dataSource.sectionModels = sections;
    
    [self.tableView reloadData];
}

#pragma mark - <SCTableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath withModel:(SCTableViewCellModel *)model {
    
}


@end
