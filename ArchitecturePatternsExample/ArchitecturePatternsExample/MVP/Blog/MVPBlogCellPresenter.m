//
//  MVPBlogCellPresenter.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/22.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVPBlogCellPresenter.h"
#import "SCBlogLikeAPIManager.h"

@interface MVPBlogCellPresenter ()
    
@property (strong, nonatomic) SCBlog *blog;
@property (strong, nonatomic) SCBlogLikeAPIManager *blogLikeApi;

@end

@implementation MVPBlogCellPresenter

    
- (instancetype)initWithBlog:(SCBlog *)blog {
    if (self = [super init]) {
        
        _blogLikeApi = [[SCBlogLikeAPIManager alloc] initWithBlogId:blog.blogId];
        _blog = blog;
    }
    
    return self;
}
    
    
#pragma mark - Format
    
- (BOOL)isLiked {
    return self.blog.isLiked;
}
    
- (NSString *)blogTitleText {
    return self.blog.blogTitle.length > 0 ? self.self.blog.blogTitle : @"标题";
}
    
- (NSString *)blogSummaryText {
    return self.blog.blogSummary.length > 0 ? [NSString stringWithFormat:@"摘要: %@", self.blog.blogSummary] : @"这个人很懒, 什么也没有写...";
}
    
- (NSString *)blogLikeCountText {
    return [NSString stringWithFormat:@"赞 %ld", self.blog.likeCount];
}
    
- (NSString *)blogShareCountText {
    return [NSString stringWithFormat:@"分享 %ld", self.blog.shareCount];
}
    
#pragma mark - Action
- (void)likeBlogWithCompletionHandler:(void (^)(NSError *, id))completionHandler {
   
    if (self.blog.isLiked) {
    
        !completionHandler ?: completionHandler([NSError errorWithDomain:@"你已经赞过了哦~" code:123 userInfo:nil], nil);
        
    } else {
        
        
        self.blog.isLiked = YES;
        self.blog.likeCount += 1;
        
        if ([self.view respondsToSelector:@selector(blogPresenterDidUpdateLikeState:)]) {
            [self.view blogPresenterDidUpdateLikeState:self];
        }
        
        // 网络请求
//        [self.blogLikeApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//            
//            if (completionHandler) {
//                completionHandler(nil, request.responseObject);
//            }
//            
//        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//            
//            self.blog.isLiked = NO;
//            self.blog.likeCount -= 1;
//            
//            if ([self.view respondsToSelector:@selector(blogPresenterDidUpdateLikeState:)]) {
//                [self.view blogPresenterDidUpdateLikeState:self];
//            }
//            
//            if (completionHandler) {
//                completionHandler(nil, request.responseObject);
//            }
//        }];
    }

}
    
- (void)shareBlogWithCompletionHandler:(void (^)(NSError *, id))completionHandler {
    // ...
}

    
@end
