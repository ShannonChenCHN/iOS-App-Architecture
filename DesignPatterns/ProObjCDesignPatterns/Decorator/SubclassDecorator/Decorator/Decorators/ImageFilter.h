//
//  ImageFilter.h
//  Decorator
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImage+ImageComponent.h"

@interface ImageFilter : NSObject <ImageComponent>

/// 用于将各装饰器串联起来的属性
/// FilterA.component -> FilterB.component -> UIImage
@property (strong, nonatomic) id <ImageComponent> component;

- (instancetype)initWithImageComponent:(id <ImageComponent>)component;
- (void)apply;

@end
