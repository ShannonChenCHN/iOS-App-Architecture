//
//  SCUserAPIManger.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/14.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCUserAPIManger.h"

@interface SCUserAPIManger ()

@property (strong, nonatomic) NSString *userId;
    
@end

@implementation SCUserAPIManger

- (instancetype)initWithUserId:(NSString *)userId {
    
    self = [super init];
    if (self) {
        _userId = userId;
    }
    
    return self;
}
    
- (NSString *)requestUrl {
    return @"";
}
    
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}
    
    
    
@end
