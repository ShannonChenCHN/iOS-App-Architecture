//
//  SCBlogCellModel.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SCBlog;

@interface SCBlogCellModel : NSObject

@property (assign, nonatomic) BOOL isLiked;
@property (copy, nonatomic) NSString *titleText;
@property (copy, nonatomic) NSString *summaryText;
@property (copy, nonatomic) NSString *likeCountText;
@property (copy, nonatomic) NSString *shareCountText;

@property (strong, nonatomic) SCBlog *blog;

- (instancetype)initWithBlog:(SCBlog *)blog;
    

@end
