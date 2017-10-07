//
//  NSObject+Calculator.m
//  FunctionalProgrammingExample
//
//  Created by ShannonChen on 2017/10/7.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "NSObject+Calculator.h"

@implementation NSObject (Calculator)

+ (int)sc_calculate:(void (^)(Calculator *))calculate {
    
    Calculator *calculator = [[Calculator alloc] init];
    calculate(calculator);
    
    return calculator.result;
}

@end
