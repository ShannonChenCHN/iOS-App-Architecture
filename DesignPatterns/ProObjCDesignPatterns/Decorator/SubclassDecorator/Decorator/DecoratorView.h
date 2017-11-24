//
//  DecoratorView.h
//  Decorator
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageComponent.h"

@interface DecoratorView : UIView

@property (strong, nonatomic) id<ImageComponent> image;

@end
