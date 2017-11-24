//
//  InputValidator.h
//  Strategy
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 一组算法的策略基类，提供相同的接口供 context 使用
 这里不使用 protocol 而使用了抽象基类的原因，在于它更容易管理各种具体策略子类的某些共同行为
 */
@interface InputValidator : NSObject

// A stub for any actual validation strategy
- (BOOL) validateInput:(UITextField *)input error:(NSError **) error;


// Template methods for subclasses
- (NSString *)regularExpressionPatternForValidation;
- (NSInteger)validationErrorCode;
- (NSString *)validationErrorReason;

@end
