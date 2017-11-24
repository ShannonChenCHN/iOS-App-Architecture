//
//  UIImage+Shadow.m
//  CategoryDecorator
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "UIImage+Shadow.h"
#import "UIImage+BaseFilter.h"

@implementation UIImage (Shadow)

- (UIImage *)applyDropShadow {
     CGContextRef context = [self beginContext];
    
    // 添加阴影
    CGSize offset = CGSizeMake(-25, 15);
    CGContextSetShadow(context, offset, 20.0);
    
    UIImage *imageOut = [self getImageFromCurrentImageContext];
    
    [self endContext];
    
    return imageOut;
}

@end
