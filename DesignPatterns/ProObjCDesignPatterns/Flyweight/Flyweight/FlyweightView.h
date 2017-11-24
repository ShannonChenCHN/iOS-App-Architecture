//
//  FlyweightView.h
//  Flyweight
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExtrinsicFlowerState.h"


/**
 绘制花朵的 container view
 */
@interface FlyweightView : UIView

@property (strong, nonatomic) NSArray <ExtrinsicFlowerState *> *flowerList;

@end
