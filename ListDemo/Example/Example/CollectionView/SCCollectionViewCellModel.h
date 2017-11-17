//
//  SCCollectionViewCellModel.h
//  Example
//
//  Created by ShannonChen on 2017/11/17.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCCollectionViewCellModel : NSObject

@property (strong, nonatomic) Class cellClass;

@property (assign, nonatomic) CGFloat cellHeight;
@property (assign, nonatomic) CGFloat cellWidth;  // 可选字段，默认是 container 的宽度
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (assign, nonatomic) NSInteger numberOfItemsInSection;
@property (strong, nonatomic) id dataModel;

- (void)collectionViewDidSelectItem:(UICollectionView *)collectionView;

@end
