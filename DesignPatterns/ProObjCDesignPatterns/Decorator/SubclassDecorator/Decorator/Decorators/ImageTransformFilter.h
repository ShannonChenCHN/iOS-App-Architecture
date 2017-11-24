//
//  ImageTransformFilter.h
//  Decorator
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ImageFilter.h"


/**
 添加变换效果的 filter
 */
@interface ImageTransformFilter : ImageFilter

@property (assign, nonatomic) CGAffineTransform transform;

- (instancetype)initWithImageComponent:(id<ImageComponent>)component transform:(CGAffineTransform)transform;


@end
