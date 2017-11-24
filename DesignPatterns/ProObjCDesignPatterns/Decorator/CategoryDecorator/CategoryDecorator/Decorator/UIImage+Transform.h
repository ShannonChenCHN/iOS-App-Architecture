//
//  UIImage+Transform.h
//  CategoryDecorator
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Transform)

- (UIImage *)applyTransform:(CGAffineTransform)transform;

@end
