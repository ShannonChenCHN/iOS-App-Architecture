//
//  SCCollectionViewController.m
//  Example
//
//  Created by ShannonChen on 2017/9/4.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCCollectionViewController.h"
#import "SCCollectionViewAdapter.h"
#import "SCCollectionViewSectionModel.h"

#import "SCCutomCollectionViewCell.h"
#import "SCCollectionSectionHeaderView.h"
#import "SCCollectionSectionFooterView.h"

@interface SCCollectionViewController () <UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) SCCollectionViewAdapter *adpter;

@end

@implementation SCCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    
    SCCollectionViewAdapter *adapter = [[SCCollectionViewAdapter alloc] init];
    adapter.collectionView = self.collectionView;
    adapter.dataSource = self;
    adapter.collectionViewDelegate = self;
    
    // 更新数据
    NSMutableArray *sections = [NSMutableArray array];
    for (int section = 0; section < 4; section++) {
        
        SCCollectionViewSectionModel *sectionModel = [[SCCollectionViewSectionModel alloc] init];
        
        NSMutableArray *rows = [NSMutableArray array];
        for (int row = 0; row < 10; row++) {
            
            SCCollectionViewCellModel *cellModel = [[SCCollectionViewCellModel alloc] init];
            cellModel.dataModel = [NSString stringWithFormat:@"%i - %i", section, row];
            cellModel.cellClass = [SCCutomCollectionViewCell class];
            cellModel.cellHeight = 100;
            
            [rows addObject:cellModel];
        }
        
        sectionModel.cellModels = rows;
        sectionModel.headerClass = [SCCollectionSectionHeaderView class];
        sectionModel.headerHeight = 50;
        sectionModel.footerClass = [SCCollectionSectionFooterView class];
        sectionModel.footerHeight = 20;
        [sections addObject:sectionModel];
    }
    adapter.sectionModels = sections;
    self.adpter = adapter;
    
    
    [self.collectionView reloadData];
}

#pragma mark -
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
}


@end
