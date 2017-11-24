//
//  CanvasView.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mark.h"

/**
 画布
 */
@interface CanvasView : UIView

@property (nonatomic, strong) id <Mark> mark;

// 模板方法
- (UIImage *)backgroundImage;

@end
