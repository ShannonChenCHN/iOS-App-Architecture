//
//  Sandwich.m
//  TemplateMethod
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Sandwich.h"

@implementation Sandwich


- (void) make {
    [self prepareBread];
    [self putBreadOnPlate];
    [self addMeat];
    [self addCondiments];
    [self extraStep];
    [self serve];
}

- (void) putBreadOnPlate {
   
}

- (void) serve {
    
}

#pragma mark -
#pragma Details will be handled by subclasses

// 通过抛出异常的方式，强制子类重写必需的步骤，保证模板方法正常工作
- (void) prepareBread {
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void) addMeat {
    
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void) addCondiments {
    
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void) extraStep{
    // 额外步骤，父类中什么都不做
}


@end
