//
//  Stroke.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Stroke.h"
#import "MarkEnumerator.h"

@interface Stroke ()

@property (nonatomic, strong) NSMutableArray <id <Mark>> *children;

@end

@implementation Stroke

@dynamic location;

- (instancetype)init {
    self = [super init];
    if (self) {
        _children = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return self;
}

- (void)setLocation:(CGPoint)location {
    // do nothing
}

- (CGPoint)location {
    if (self.children.count > 0) {
        return self.children.firstObject.location;
    } else {
        return CGPointZero;
    }
}

- (void)addMark:(id<Mark>)mark {
    [self.children addObject:mark];
}

- (void)removeMark:(id<Mark>)mark {
    if ([self.children containsObject:mark]) {
        // 如果 mark 在这一层，将其移除并返回
        [self.children removeObject:mark];
        
    } else {
        // 否则，让每个子节点去找它
        [self.children makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}

- (id<Mark>)childMarkAtIndex:(NSUInteger)index {
    if (index >= self.children.count) {
        return nil;
    } else {
        return self.children[index];
    }
}

- (id<Mark>)lastChild {
    return self.children.lastObject;
}

- (NSUInteger)count {
    return self.children.count;
}


- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    
    // 后序遍历：先访问子节点，后访问父节点
    
    for (id <Mark> child in self.children) {
        [child acceptMarkVisitor:visitor];
    }
    
    [visitor visitStroke:self];
}

#pragma mark - Enumerator method
- (NSEnumerator *)enumerator {
    // 具体的迭代算法交给单独的 MarkEnumerator 类去处理
    return [[MarkEnumerator alloc] initWithMark:self];
}

- (void)enumerateMarksUsingBlock:(void (^)(id<Mark>, BOOL *))block {
    BOOL stop = NO;
    
    NSEnumerator *enumerator = self.enumerator;
    
    for (id <Mark> aMark in enumerator) {
        block(aMark, &stop);
        if (stop) {
            break;
        }
    }
}

#pragma mark - An Extended Direct-draw Example

// for a direct draw example
- (void)drawWithContext:(CGContextRef)context {
    
    // 起点
    CGContextMoveToPoint(context, self.location.x, self.location.y);
    
    // 绘制子元素
    for (id <Mark> mark in self.children) {
        [mark drawWithContext:context];
    }
    
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
}


#pragma mark - <NSCopying>
- (id)copyWithZone:(NSZone *)zone {

    
    Stroke *strokeCopy = [[[Stroke class] allocWithZone:zone] init];
    
    strokeCopy.color = [UIColor colorWithCGColor:self.color.CGColor];
    
    strokeCopy.size = self.size;
    
    for (id <Mark> child in self.children) {
        id <Mark> childCopy = [child copy];
        [strokeCopy addMark:childCopy];
    }
    
    return strokeCopy;
}


#pragma mark - NSCoder methods

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        _color = [coder decodeObjectForKey:@"StrokeColor"];
        _size = [coder decodeFloatForKey:@"StrokeSize"];
        _children = [coder decodeObjectForKey:@"StrokeChildren"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_color forKey:@"StrokeColor"];
    [coder encodeFloat:_size forKey:@"StrokeSize"];
    [coder encodeObject:_children forKey:@"StrokeChildren"];
}

@end
