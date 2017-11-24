//
//  Example5.m
//  DependencyInjection
//
//  Created by ShannonChen on 2017/11/24.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Example5.h"

@implementation Article

- (void)publish {
    self.publishedAt = [NSDate date];
}

@end




@implementation NSDate(dateStub)

+ (instancetype)dateStub {
    return [NSDate dateWithTimeIntervalSince1970:10000000]; // some arbitrary date value
}

@end
