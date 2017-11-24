//
//  Stack.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/19.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Stack.h"

@interface Stack ()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation Stack

- (instancetype)init {
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithCapacity:(NSUInteger)numItems {
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc] initWithCapacity:numItems];
    }
    return self;
}

- (NSInteger)count {
    return self.array.count;
}

- (void)push:(id)object {
    
    [self.array addObject:object];
}

- (id)pop {
    if (self.array.count == 0) {
        return nil;
    }
    
    id object = self.array.lastObject;
    
    [self.array removeLastObject];
    
    return object;
}


- (id)dropBottom {
    if (self.array.count == 0) {
        return nil;
    }
    
    id object = self.array.firstObject;
    
    [self.array removeObjectAtIndex:0];
    
    return object;
}

- (NSEnumerator *)reverseObjectEnumerator {
    return [self.array reverseObjectEnumerator];
}

@end
