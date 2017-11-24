//
//  MarkRenderer.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/16.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkVisitor.h"
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"

@interface MarkRenderer : NSObject <MarkVisitor>

- (instancetype)initWithCGContext:(CGContextRef)context;

@end
