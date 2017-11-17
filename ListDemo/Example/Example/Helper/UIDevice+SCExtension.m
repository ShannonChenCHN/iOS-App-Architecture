//
//  UIDevice+SCExtension.m
//  Example
//
//  Created by ShannonChen on 2017/11/17.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "UIDevice+SCExtension.h"

@implementation UIDevice (SCExtension)

// https://stackoverflow.com/a/3339787
// https://pspdfkit.com/blog/2016/efficient-iOS-version-checking/
+ (BOOL)sc_systemVersionGreaterThanOrEqualTo:(NSString *)requiredVersion {
    
    NSString *currentVersion = [[UIDevice currentDevice] systemVersion];
    if ([currentVersion compare:requiredVersion options:NSNumericSearch] != NSOrderedAscending) {
        return YES;
    }
    
    return NO;
}

@end
