//
//  ScribbleMemento+Friend.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ScribbleMemento.h"
#import "Mark.h"


/**
 这个文件通过 extension 的方式提供了宽接口给 Originator（Scribble） 和 Memento（ScribbleMemento）
 宽接口为对象的使用提供更多的选项和自由度，而且还具有一定的私有性，因为它是非完全公开的
 */
@interface ScribbleMemento ()

@property (copy, nonatomic) id <Mark> mark; // 保存 Scribble 的内部状态，值得注意的是，这里我们用的是 copy
@property (assign, nonatomic) BOOL hasComleteSnapshot; // 用于告诉 Scribble 对象这里保存的是完整的快照还是只是个片段

- (instancetype)initWithMark:(id <Mark>)mark;

@end
