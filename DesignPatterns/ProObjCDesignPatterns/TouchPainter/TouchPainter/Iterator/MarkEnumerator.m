//
//  MarkEnumerator.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/15.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MarkEnumerator.h"
#import "Stack.h"

@interface MarkEnumerator ()

@property (nonatomic, strong) Stack <id <Mark>> *stack;

@end

@implementation MarkEnumerator

- (instancetype)initWithMark:(id<Mark>)mark {
    if (self = [super init]) {
        _stack = [[Stack alloc] initWithCapacity:mark.count];
        
        [self traverseAndBuildStackWithMark:mark];
    }
    return self;
}

#pragma amrk - Override

- (NSArray *)allObjects {
    // 返回逆序的元素集合
    return [self.stack reverseObjectEnumerator].allObjects;
}

- (id)nextObject {
    return [self.stack pop];
}


#pragma mark - Private

- (void)traverseAndBuildStackWithMark:(id<Mark>)mark {
    if (mark == nil) {
        return;
    }
    
    [self.stack push:mark];
    
    NSUInteger index = mark.count;
    id <Mark> childMark;
    while (childMark = [mark childMarkAtIndex:--index]) {
        [self traverseAndBuildStackWithMark:childMark];
    }
}

@end
