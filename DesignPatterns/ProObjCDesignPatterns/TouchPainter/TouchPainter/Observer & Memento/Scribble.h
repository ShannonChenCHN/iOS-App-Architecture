//
//  Scribble.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/12.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
#import "ScribbleMemento.h"


/**
 涂鸦 model
 */
@interface Scribble : NSObject

@property (nonatomic, strong) id <Mark> mark;

// 管理 Mark 的方法
- (void)addMark:(id <Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark;
- (void)removeMark:(id <Mark>)aMark;

// 备忘录相关方法
- (instancetype)initWithMemento:(ScribbleMemento *)memento;
+ (Scribble *)scribbleWithMemento:(ScribbleMemento *)memento;
- (ScribbleMemento *)scribbleMemento;
- (ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasComleteSnapshot;
- (void)attachStateFromMemento:(ScribbleMemento *)memento;

@end
