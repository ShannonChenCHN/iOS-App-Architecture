//
//  SCCollectionViewSectionHeaderFooter.h
//  Example
//
//  Created by ShannonChen on 2017/11/17.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCCollectionViewSectionModel.h"

@protocol SCCollectionViewSectionHeaderFooter <NSObject>

@optional
@property (strong, nonatomic) SCCollectionViewSectionModel *sectionModel;

@end
