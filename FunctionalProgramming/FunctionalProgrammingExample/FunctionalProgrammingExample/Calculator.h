//
//  Calculator.h
//  FunctionalProgrammingExample
//
//  Created by ShannonChen on 2017/10/7.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (assign, nonatomic) int result;

- (Calculator *(^)(int))start;

- (Calculator *(^)(int))add;
- (Calculator *(^)(int))subtract;
- (Calculator *(^)(int))multiply;
- (Calculator *(^)(int))divide;

- (Calculator *)square;

@end
