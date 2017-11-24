//
//  ThmbnailCollectionViewCell.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ThumbnailCollectionViewCell.h"

@implementation ThumbnailCollectionViewCell

- (void)setThumbnailView:(UIView *)thumbnailView {
//    if (thumbnailView != _thumbnailView) {
        UIView *oldView = _thumbnailView;
        UIView *newView = thumbnailView;
    
        [oldView removeFromSuperview];
        [self addSubview:newView];
    
        _thumbnailView = newView;
//    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.thumbnailView.frame = self.bounds;
}

@end
