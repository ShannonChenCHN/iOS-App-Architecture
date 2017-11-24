//
//  Example3.h
//  DependencyInjection
//
//  Created by ShannonChen on 2017/11/24.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 属性注入
 */
@interface Example3 : NSObject

@property (nonatomic, strong) NSUserDefaults *userDefaults;

- (NSNumber *)nextReminderId;

@end
