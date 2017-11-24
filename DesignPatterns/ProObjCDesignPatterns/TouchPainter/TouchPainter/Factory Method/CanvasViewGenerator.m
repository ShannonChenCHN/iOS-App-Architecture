//
//  CanvasViewGenerator.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "CanvasViewGenerator.h"
#import "PaperCanvasViewGenerator.h"
#import "ClothCanvasViewGenerator.h"

@implementation CanvasViewGenerator

- (instancetype)init {
    if ([self isMemberOfClass:[CanvasViewGenerator class]]) {
        return [self initWithStyle:CanvasViewStyleDefault];
    } else {
        return [super init];
    }
    
}


- (instancetype)initWithStyle:(CanvasViewStyle)style {

    if ([self isMemberOfClass:[CanvasViewGenerator class]]) {
        
        switch (style) {
        
            case CanvasViewStyleCloth:
                return [[ClothCanvasViewGenerator alloc] initWithStyle:style];
                break;
                
            case CanvasViewStylePaper:
                return [[PaperCanvasViewGenerator alloc] initWithStyle:style];
                break;
                
            case CanvasViewStyleDefault:
            default:
                return [super init];
                break;
        }
        
    } else {
        return [super init];
    }
    
}

- (CanvasView *)canvasViewWithFrame:(CGRect)frame {

    return [[CanvasView alloc] initWithFrame:frame];
}

@end
