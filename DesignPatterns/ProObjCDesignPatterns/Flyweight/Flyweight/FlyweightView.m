//
//  FlyweightView.m
//  Flyweight
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "FlyweightView.h"

@implementation FlyweightView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    for (ExtrinsicFlowerState *state in self.flowerList)     {

        UIView *flowerView = state.flowerView;
        CGRect area = state.area;
        
        [flowerView drawRect:area];
    }
}


@end
