//
//  ImageShadowFilter.m
//  Decorator
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ImageShadowFilter.h"

@implementation ImageShadowFilter

- (void)apply {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置阴影效果
    CGSize offset = CGSizeMake(-25, 15);
    CGContextSetShadow(context, offset, 20.0);
}

@end
