//
//  SCUserAPI.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SCUserAPI <NSObject>

- (instancetype)initWithUserId:(NSString *)userId;

@end
