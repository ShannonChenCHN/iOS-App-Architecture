//
//  SCCollectionViewCellModel.m
//  Example
//
//  Created by ShannonChen on 2017/11/17.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCCollectionViewCellModel.h"

@implementation SCCollectionViewCellModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _cellHeight = CGFLOAT_MAX;
        _cellWidth = CGFLOAT_MAX;
    }
    return self;
}

- (void)collectionViewDidSelectItem:(UICollectionView *)collectionView {
    // 子类重写
}

@end
