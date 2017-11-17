//
//  SCCollectionViewCell.h
//  Example
//
//  Created by ShannonChen on 2017/11/17.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCCollectionViewCellModel.h"

@protocol SCCollectionViewCell <NSObject>


@required
@property (strong, nonatomic) SCCollectionViewCellModel *cellModel;

@optional
+ (CGFloat)cellHeightWithModel:(SCCollectionViewCellModel *)model;
+ (CGFloat)cellWidthWithModel:(SCCollectionViewCellModel *)model;


@end
