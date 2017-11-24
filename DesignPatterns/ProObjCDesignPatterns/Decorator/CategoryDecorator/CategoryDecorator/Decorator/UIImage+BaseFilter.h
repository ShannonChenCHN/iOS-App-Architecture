//
//  UIImage+BaseFilter.h
//  CategoryDecorator
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 装饰器的抽象基类，定义基本的二维绘图操作，其他的装饰器都可以使用这个 category 中定义的几个方法
 */
@interface UIImage (BaseFilter)

/// 获取上下文
- (CGContextRef)beginContext;

/// 从上下文中获取图片
- (UIImage *)getImageFromCurrentImageContext;

/// 关闭上下文
- (void)endContext;

@end
