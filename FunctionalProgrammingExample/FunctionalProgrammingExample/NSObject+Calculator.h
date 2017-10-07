//
//  NSObject+Calculator.h
//  FunctionalProgrammingExample
//
//  Created by ShannonChen on 2017/10/7.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

@interface NSObject (Calculator)

+ (int)sc_calculate:(void(^)(Calculator *))block;

@end
