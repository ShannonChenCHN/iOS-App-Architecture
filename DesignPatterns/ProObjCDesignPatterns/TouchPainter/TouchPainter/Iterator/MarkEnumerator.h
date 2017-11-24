//
//  MarkEnumerator.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/15.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"


/**
 迭代器
 */
@interface MarkEnumerator : NSEnumerator

- (instancetype)initWithMark:(id <Mark>)mark;

@end
