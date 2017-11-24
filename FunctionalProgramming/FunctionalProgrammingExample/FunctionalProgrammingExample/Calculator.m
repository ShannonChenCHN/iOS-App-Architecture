//
//  Calculator.m
//  FunctionalProgrammingExample
//
//  Created by ShannonChen on 2017/10/7.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

- (Calculator *(^)(int))start {

    return ^Calculator *(int value){
        self.result = value;
        return self;
    };
}

- (Calculator *(^)(int))add {
    return ^Calculator *(int value) {
        self.result += value;
        return self;
    };
}


- (Calculator *(^)(int))subtract {
    return ^Calculator *(int value) {
        self.result -= value;
        return self;
    };

}

- (Calculator *(^)(int))multiply {
    return ^Calculator *(int value) {
        self.result *= value;
        return self;
    };

}

- (Calculator *(^)(int))divide {
    return ^Calculator *(int value) {
        self.result /= value;
        return self;
    };

}

- (Calculator *)square {

    self.result = pow(self.result, 2);
    return self;
}

@end
