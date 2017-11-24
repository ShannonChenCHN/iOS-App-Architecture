//
//  InputValidator.m
//  Strategy
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "InputValidator.h"

static NSString * const kInputValidationErrorDomain = @"InputValidationErrorDomain";

@implementation InputValidator

// A stub for any actual validation strategy
- (BOOL)validateInput:(UITextField *)input error:(NSError **) error {
    NSError *regError = nil;
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:self.regularExpressionPatternForValidation
                                  options:NSRegularExpressionAnchorsMatchLines
                                  error:&regError];
    
    NSUInteger numberOfMatches = [regex
                                  numberOfMatchesInString:input.text
                                  options:NSMatchingAnchored
                                  range:NSMakeRange(0, input.text.length)];
    
    // if there is not a single match
    // then return an error and NO
    if (numberOfMatches == 0) {
        if (error != nil) {
            NSString *description = NSLocalizedString(@"Input Validation Failed", @"");
            NSString *reason = self.validationErrorReason ? : @"";
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey : description,
                                       NSLocalizedFailureReasonErrorKey : reason};
            *error = [NSError errorWithDomain:kInputValidationErrorDomain
                                         code:self.validationErrorCode
                                     userInfo:userInfo];
        }
        
        return NO;
    }
    
    return YES;
}


#pragma mark - Subclassing
- (NSString *)regularExpressionPatternForValidation {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"" userInfo:nil];
    return nil;
}

- (NSInteger)validationErrorCode {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"" userInfo:nil];
    return 0;
}

- (NSString *)validationErrorReason {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"" userInfo:nil];
    return nil;
}

@end
