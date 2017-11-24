//
//  UIView+SCLayout.m
//  SCKitDemo
//
//  Created by ShannonChen on 17/4/28.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "UIView+SCLayout.h"

@implementation UIView (SCLayout)

#pragma mark - x, y, width, height
- (void)setX:(CGFloat)x{
    CGRect frame     = self.frame;
    frame.origin.x   = x;
    self.frame       = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    CGRect frame    = self.frame;
    frame.origin.y  = y;
    self.frame      = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width{
    CGRect frame        = self.frame;
    frame.size.width    = width;
    self.frame          = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height{
    CGRect frame        = self.frame;
    frame.size.height   = height;
    self.frame          = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}



#pragma mark - origin, size
- (void)setOrigin:(CGPoint)origin{
    self.x = origin.x;
    self.y = origin.y;
}


- (CGPoint)origin {
    return CGPointMake(self.x, self.y);
}

- (void)setSize:(CGSize)size{
    self.width      = size.width;
    self.height     = size.height;
}

- (CGSize)size {
    return CGSizeMake(self.width, self.height);
}



#pragma mark - top, left, bottom, right
- (void)setTop:(CGFloat)top {
    self.y = top;
}

- (CGFloat)top {
    return self.y;
}

- (void)setLeft:(CGFloat)left {
    self.x = left;
}

- (CGFloat)left {
    return self.x;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}



#pragma mark - centerX, centerY
- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)centerY {
    return self.center.y;
}


@end
