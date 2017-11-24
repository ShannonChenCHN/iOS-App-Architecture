//
//  MarkRenderer.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/16.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MarkRenderer.h"

@interface MarkRenderer ()

@property (nonatomic, assign) CGContextRef context;
@property (nonatomic, assign) BOOL shouldMoveContextToDot;

@end

@implementation MarkRenderer

- (instancetype)initWithCGContext:(CGContextRef)context {
    if (self = [super init]) {
        _context = context;
        _shouldMoveContextToDot = YES;
    }
    
    return self;
}

- (void)visitMark:(id<Mark>)mark {}

- (void)visitDot:(Dot *)dot {
    CGFloat x = dot.location.x;
    CGFloat y = dot.location.y;
    CGFloat frameSize = dot.size;
    CGRect frame = CGRectMake(x - frameSize / 2.0, y - frameSize / 2.0, frameSize, frameSize);
    
    CGContextSetFillColorWithColor(self.context, dot.color.CGColor);
    CGContextFillEllipseInRect(self.context, frame);
}

- (void)visitVertex:(Vertex *)vertex {
    CGFloat x = vertex.location.x;
    CGFloat y = vertex.location.y;
    
    if (self.shouldMoveContextToDot) {
        
        CGContextMoveToPoint(self.context, x, y);
        self.shouldMoveContextToDot = NO;
        
    } else {
        CGContextAddLineToPoint(self.context, x, y);
    }
}

- (void)visitStroke:(Stroke *)stroke {
    CGContextSetStrokeColorWithColor(self.context, stroke.color.CGColor);
    CGContextSetLineWidth(self.context, stroke.size);
    CGContextSetLineCap(self.context, kCGLineCapRound);
    CGContextStrokePath(self.context);
    
    self.shouldMoveContextToDot = YES;
}

@end
