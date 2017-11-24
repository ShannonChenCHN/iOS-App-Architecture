//
//  ImageTransformFilter.m
//  Decorator
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ImageTransformFilter.h"

@implementation ImageTransformFilter

- (instancetype)initWithImageComponent:(id<ImageComponent>)component transform:(CGAffineTransform)transform {
    
    if (self = [super initWithImageComponent:component]) {
        _transform = transform;
    }
    
    return self;
}


- (void)apply {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置变换
    CGContextConcatCTM(context, self.transform);
}

@end
