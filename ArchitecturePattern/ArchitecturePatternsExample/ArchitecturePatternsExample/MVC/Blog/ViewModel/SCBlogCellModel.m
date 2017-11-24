//
//  SCBlogCellModel.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCBlogCellModel.h"
#import "SCBlog.h"

@implementation SCBlogCellModel

- (instancetype)initWithBlog:(SCBlog *)blog {
    if (self = [super init]) {
        
        _blog = blog;
        
        _isLiked = blog.isLiked;
        _titleText = blog.blogTitle.length > 0 ? self.blog.blogTitle : @"未命名";
        _summaryText = blog.blogSummary.length > 0 ? [NSString stringWithFormat:@"摘要: %@", blog.blogSummary] : @"这个人很懒, 什么也没有写...";
        _likeCountText = [NSString stringWithFormat:@"赞 %ld", self.blog.likeCount];
        _shareCountText = [NSString stringWithFormat:@"分享 %ld", self.blog.shareCount];
    }
    
    return self;
}

@end
