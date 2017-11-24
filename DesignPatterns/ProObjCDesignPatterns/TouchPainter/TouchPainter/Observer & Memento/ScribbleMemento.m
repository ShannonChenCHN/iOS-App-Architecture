//
//  ScribbleMemento.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ScribbleMemento.h"
#import "ScribbleMemento+Friend.h"
#import "Mark.h"

@implementation ScribbleMemento

- (instancetype)initWithMark:(id <Mark>)mark {
    self = [super init];
    if (self) {
        _mark = [mark copy]; // 值得注意的是，这里我们用的是 copy，因为如果原始的 mark 对象在别处被修改了，我们需要保证内部的 mark 对象的状态不受影响
    }
    return self;
}

- (NSData *)data {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.mark];
    return data;
}

+ (ScribbleMemento *)mementoWithData:(NSData *)data {
    id <Mark> restoredMark = (id <Mark>)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    ScribbleMemento *memento = [[ScribbleMemento alloc] initWithMark:restoredMark];
    return memento;
}

@end
