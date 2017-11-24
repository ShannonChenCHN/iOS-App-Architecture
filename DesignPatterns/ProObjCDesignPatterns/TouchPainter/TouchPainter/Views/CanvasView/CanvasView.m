//
//  CanvasView.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "CanvasView.h"
#import "MarkRenderer.h"

@implementation CanvasView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UIImage *)backgroundImage {
    return nil;
}

- (void)drawRect:(CGRect)rect {
    
    if (self.backgroundImage) {
        [self.backgroundImage drawInRect:rect];
    }
    
    if (self.mark) {
        // 获取绘图上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        // 创建绘图器
        MarkRenderer *markRenderer = [[MarkRenderer alloc] initWithCGContext:context];
        
        // 把 renderer 沿着 mark 组合结构传递
        [self.mark acceptMarkVisitor:markRenderer];
    }
    
}

@end
