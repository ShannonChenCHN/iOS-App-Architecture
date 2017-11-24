//
//  UIImage+Transform.m
//  CategoryDecorator
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "UIImage+Transform.h"
#import "UIImage+BaseFilter.h"

@implementation UIImage (Transform)

- (UIImage *)applyTransform:(CGAffineTransform)transform {
    
    CGContextRef context = [self beginContext];
    
    // 设置变换
    CGContextConcatCTM(context, transform);
    
    UIImage *imageOut = [self getImageFromCurrentImageContext];
    
    [self endContext];
    
    return imageOut;
}

@end
