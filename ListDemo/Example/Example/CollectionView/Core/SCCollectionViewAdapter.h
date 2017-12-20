//
//  SCCollectionViewAdapter.h
//  Example
//
//  Created by ShannonChen on 2017/11/17.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCCollectionViewSectionModel.h"


@interface SCCollectionViewAdapter : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) id dataSource;
@property (weak, nonatomic) id <UICollectionViewDelegate> collectionViewDelegate;
@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) NSArray <SCCollectionViewSectionModel *> *sectionModels;

@end
