//
//  Scribble.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/12.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Scribble.h"
#import "Stroke.h"
#import "ScribbleMemento+Friend.h"

@interface Scribble ()


@end

@implementation Scribble {
    id <Mark> _parentMark; // 内部 mark 组合结构的根节点
    id <Mark> _incrementalMark; // 用于保存添加到 _parentMark 的完整线条或者点的引用
}

@synthesize mark = _parentMark;

- (instancetype)init {
    self = [super init];
    if (self) {
        // 父节点应该是一个组合对象，也就是 Stroke
        _parentMark = [[Stroke alloc] init];
    }
    return self;
}
    
#pragma mark - Methods for Mark management
- (void)addMark:(id<Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark {
    // 手动调用 KVO
    [self willChangeValueForKey:NSStringFromSelector(@selector(mark))];
    
    if (shouldAddToPreviousMark) {  // 如果是顶点就拼在后面
        [_parentMark.lastChild addMark:aMark];
    } else {
        [_parentMark addMark:aMark];  // 如果是点或者线就直接存起来
        _incrementalMark = aMark;
    }
    
    // 手动调用 KVO
    [self didChangeValueForKey:NSStringFromSelector(@selector(mark))];
}
    
- (void)removeMark:(id<Mark>)aMark {
    
    if (aMark == _parentMark) {
        return;
    }
    
    
    [self willChangeValueForKey:NSStringFromSelector(@selector(mark))];
    
    [_parentMark removeMark:aMark];
    
    if (aMark == _incrementalMark) {
        _incrementalMark = nil;
    }
    
    [self didChangeValueForKey:NSStringFromSelector(@selector(mark))];
}

#pragma mark - Methods for memento
- (instancetype)initWithMemento:(ScribbleMemento *)memento {
    if (self = [super init]) {
        if (memento.hasComleteSnapshot) {
            _parentMark = memento.mark;
        } else {
            _parentMark = [[Stroke alloc] init];
            [self attachStateFromMemento:memento];
        }
    }
    
    return self;
}

- (void)attachStateFromMemento:(ScribbleMemento *)memento {
    [self addMark:memento.mark shouldAddToPreviousMark:NO];
}

- (ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasComleteSnapshot {
    id <Mark> mementoMark = _incrementalMark;
    
    // 如果需要返回完整的快照，就把它设为 _parentMark
    if (hasComleteSnapshot) {
        
        mementoMark = _parentMark;
        
    } else if (mementoMark == nil) {
        return nil;
    }
    
    ScribbleMemento *memento = [[ScribbleMemento alloc] initWithMark:mementoMark];
    memento.hasComleteSnapshot = hasComleteSnapshot;
    
    return memento;
}

+ (Scribble *)scribbleWithMemento:(ScribbleMemento *)memento {
    Scribble *scribble = [[Scribble alloc] initWithMemento:memento];
    return scribble;
}

- (ScribbleMemento *)scribbleMemento {
    return [self scribbleMementoWithCompleteSnapshot:YES];
}
    
@end
