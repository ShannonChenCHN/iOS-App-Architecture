//
//  SCCollectionViewSectionModel.h
//  Example
//
//  Created by ShannonChen on 2017/11/17.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCCollectionViewCellModel.h"

@interface SCCollectionViewSectionModel : NSObject

@property (strong, nonatomic) Class headerClass;
@property (copy, nonatomic) NSString *headerTitle;
@property (copy, nonatomic) NSString *headerSubtitle;
@property (assign, nonatomic) CGFloat headerHeight;
@property (strong, nonatomic) id headerModel;  // 可选字段

@property (assign, nonatomic) NSInteger section;
@property (assign, nonatomic) NSInteger numberOfSectionsInCollectionView;

@property (strong, nonatomic) NSArray <SCCollectionViewCellModel *> *cellModels;

@property (copy, nonatomic) NSString *footerTitle;
@property (assign, nonatomic) CGFloat footerHeight;
@property (strong, nonatomic) Class footerClass;

@end
