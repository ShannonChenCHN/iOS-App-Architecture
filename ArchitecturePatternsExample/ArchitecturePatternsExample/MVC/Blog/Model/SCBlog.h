//
//  SCBlog.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCBlog : NSObject

- (instancetype)initWithBlogId:(NSString *)blogId;

@property (copy, nonatomic) NSString *blogTitle;
@property (copy, nonatomic) NSString *blogSummary;
@property (copy, nonatomic) NSString *blogId;
@property (assign, nonatomic) BOOL isLiked;
@property (assign, nonatomic) NSUInteger likeCount;
@property (assign, nonatomic) NSUInteger shareCount;


@end
