//
//  CanvasViewGenerator.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CanvasView.h"


typedef NS_ENUM(NSInteger, CanvasViewStyle) {
    CanvasViewStyleDefault,
    CanvasViewStylePaper,
    CanvasViewStyleCloth,
};


/**
 画布生成器（采用了工厂方法/类簇模式）
 注：其实这里也可以不用画布生成器来决定生成何种画布，而用 CanvasView 基类自己去决定，
    就像 NSNumber 那样，NSNumber 作为基类提供不同的接口，只是在实现这些工厂方法时交给对应的子类去处理
 */
@interface CanvasViewGenerator : NSObject


- (instancetype)initWithStyle:(CanvasViewStyle)style;

- (CanvasView *)canvasViewWithFrame:(CGRect)frame;

@end
