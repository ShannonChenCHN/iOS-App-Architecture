//
//  Stack.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/19.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack<ObjectType> : NSObject

@property (nonatomic, assign, readonly) NSInteger count;

- (instancetype)initWithCapacity:(NSUInteger)numItems;

- (void)push:(ObjectType)object;
- (ObjectType)pop;
- (ObjectType)dropBottom;

- (NSEnumerator<ObjectType> *)reverseObjectEnumerator;

@end
