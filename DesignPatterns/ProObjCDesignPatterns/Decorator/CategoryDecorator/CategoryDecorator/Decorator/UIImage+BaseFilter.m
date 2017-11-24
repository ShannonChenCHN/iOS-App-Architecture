//
//  UIImage+BaseFilter.m
//  CategoryDecorator
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "UIImage+BaseFilter.h"

@implementation UIImage (BaseFilter)

- (CGContextRef)beginContext {
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    return context;
}

- (UIImage *)getImageFromCurrentImageContext {
    [self drawAtPoint:CGPointZero];
    
    UIImage *imageOut = UIGraphicsGetImageFromCurrentImageContext();
    
    return imageOut;
}

- (void)endContext {
    UIGraphicsEndImageContext();
}

@end
