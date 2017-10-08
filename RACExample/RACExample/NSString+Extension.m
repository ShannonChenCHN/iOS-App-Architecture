//
//  NSString+Extension.m
//  RACExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (BOOL)containsNoCapitalLetter {

    NSString *regex = @"^[^A-Z]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

@end
