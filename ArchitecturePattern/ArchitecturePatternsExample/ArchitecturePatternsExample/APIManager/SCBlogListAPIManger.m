//
//  SCBlogListAPIManger.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCBlogListAPIManger.h"

@interface SCBlogListAPIManger ()

@property (strong, nonatomic) NSString *userId;
@property (assign, nonatomic) NSInteger currentPage;

@end

@implementation SCBlogListAPIManger

- (instancetype)initWithUserId:(NSString *)userId {
    
    self = [super init];
    if (self) {
        _userId = userId;
        _currentPage = 0;
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
