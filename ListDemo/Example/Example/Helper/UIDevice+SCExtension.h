//
//  UIDevice+SCExtension.h
//  Example
//
//  Created by ShannonChen on 2017/11/17.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version) [UIDevice sc_systemVersionGreaterThanOrEqualTo:version]

@interface UIDevice (SCExtension)

/// 当前系统版本号是否大于或等于 required version
+ (BOOL)sc_systemVersionGreaterThanOrEqualTo:(NSString *)requiredVersion;

@end
