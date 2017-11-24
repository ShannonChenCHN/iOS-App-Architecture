//
//  SCBlog.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCBlog.h"

@implementation SCBlog

- (instancetype)initWithBlogId:(NSString *)blogId {
    
    if (self = [super init]) {
        
        self.blogId = blogId;
        self.isLiked = blogId.integerValue % 2;
        self.likeCount = blogId.integerValue + 10;
        self.blogTitle = [NSString stringWithFormat:@"blogTitle%@", blogId];
        self.shareCount = blogId.integerValue + 8;
        self.blogSummary = [NSString stringWithFormat:@"blogSummary%@", blogId];
    }
    
    return self;
}

@end
