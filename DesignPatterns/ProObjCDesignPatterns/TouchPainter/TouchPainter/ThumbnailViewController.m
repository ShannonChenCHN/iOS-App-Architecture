//
//  ThumbnailViewController.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/12.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ThumbnailViewController.h"
#import "ScribbleManager.h"
#import "ThumbnailCollectionViewCell.h"

@interface ThumbnailViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) ScribbleManager *scribbleManager;

@end

@implementation ThumbnailViewController

static NSString * const kCellIdentifier = @"ThumbnailCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
    
    
    NSUInteger numberOfScribbles = self.scribbleManager.numberOfScribbles;
    self.navigationItem.title = [NSString stringWithFormat:
                                 numberOfScribbles > 1 ? @"%@ items" : @"%@ item",
                        @(numberOfScribbles)];
    
    
    [self.collectionView registerClass:[ThumbnailCollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    [self.view addSubview:self.collectionView];
    
}

- (void)done {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.scribbleManager.numberOfScribbles;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ThumbnailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    
    UIView *scribbleThumbnail = [self.scribbleManager scribbleThumbnailViewAtIndex:indexPath.item];
    cell.thumbnailView = scribbleThumbnail;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 130);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

- (ScribbleManager *)scribbleManager {
    if (!_scribbleManager) {
        _scribbleManager = [[ScribbleManager alloc] init];
    }
    return _scribbleManager;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}


@end
