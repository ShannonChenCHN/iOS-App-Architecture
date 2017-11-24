//
//  NumericInputValidator.m
//  Strategy
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "NumericInputValidator.h"


@implementation NumericInputValidator

- (NSString *)regularExpressionPatternForValidation {
    return @"^[0-9]*$";
}

- (NSString *)validationErrorReason {
    return NSLocalizedString(@"The input can only contain numerical values", @"");
}

- (NSInteger)validationErrorCode {
    return 1001;
}

@end
