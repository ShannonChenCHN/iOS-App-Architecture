//
//  SCUser.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const kCurrentUserId = @"123";

@interface SCUser : NSObject


- (instancetype)initWithUserId:(NSString *)userId;

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *avartarURLString;
@property (copy, nonatomic) NSString *summary;
@property (copy, nonatomic) NSString *userId;
@property (assign, nonatomic) NSUInteger blogCount;
@property (assign, nonatomic) NSUInteger friendCount;


@end
