//
//  SCCollectionViewSectionModel.m
//  Example
//
//  Created by ShannonChen on 2017/11/17.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCCollectionViewSectionModel.h"

@implementation SCCollectionViewSectionModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _headerHeight = CGFLOAT_MAX;
        _footerHeight = CGFLOAT_MAX;
    }
    return self;
}

@end
