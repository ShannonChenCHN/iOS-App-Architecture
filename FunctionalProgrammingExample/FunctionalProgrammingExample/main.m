//
//  main.m
//  FunctionalProgrammingExample
//
//  Created by ShannonChen on 2017/10/7.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Calculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int result = [NSObject sc_calculate:^(Calculator *calculator) {
            // ((0 + 5) - 3)^2 - 2
            calculator.start(0).add(5).subtract(3).square.multiply(2);
        }];
        
        NSLog(@"%i", result);

    }
    return 0;
}
