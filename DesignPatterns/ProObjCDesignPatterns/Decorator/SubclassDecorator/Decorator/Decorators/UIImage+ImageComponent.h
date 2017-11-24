//
//  UIImage+ImageComponent.h
//  Decorator
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageComponent.h"


/**
 这个分类的目的是为了告诉编译器 UIImage 也是一种 ImageComponent
 */
@interface UIImage (ImageComponent) <ImageComponent>



@end
