//
//  AlphaInputValidator.m
//  Strategy
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "AlphaInputValidator.h"

@implementation AlphaInputValidator


- (NSString *)regularExpressionPatternForValidation {
    return @"^[a-zA-Z]*$";
}

- (NSString *)validationErrorReason {
    return NSLocalizedString(@"The input can only contain letters", @"");
}

- (NSInteger)validationErrorCode {
    return 1002;
}

@end
