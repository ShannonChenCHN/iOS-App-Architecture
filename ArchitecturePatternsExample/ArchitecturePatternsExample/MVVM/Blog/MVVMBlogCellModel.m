//
//  MVVMBlogCellModel.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVVMBlogCellModel.h"

#import "SCBlogLikeAPIManager.h"

@interface MVVMBlogCellModel ()
    
@property (strong, nonatomic) SCBlogLikeAPIManager *blogLikeApi;

@end

@implementation MVVMBlogCellModel

- (instancetype)initWithBlog:(SCBlog *)blog {
    if (self = [super init]) {
        
        _blogLikeApi = [[SCBlogLikeAPIManager alloc] initWithBlogId:blog.blogId];
        _blog = blog;
        
        @weakify(self);
        RAC(self, isLiked) = RACObserve(self.blog, isLiked);
        [RACObserve(self.blog, blogTitle) subscribeNext:^(id x) {
            @strongify(self);
            self.blogTitleText = self.blog.blogTitle.length > 0 ? self.self.blog.blogTitle : @"标题";
        }];
        
        [RACObserve(self.blog, blogSummary) subscribeNext:^(id x) {
            @strongify(self);
            self.blogSummaryText = self.blog.blogSummary.length > 0 ? [NSString stringWithFormat:@"摘要: %@", self.blog.blogSummary] : @"这个人很懒, 什么也没有写...";
        }];
        
        [RACObserve(self.blog, likeCount) subscribeNext:^(id x) {
            @strongify(self);
            self.blogLikeCountText = [NSString stringWithFormat:@"赞 %ld", self.blog.likeCount];
        }];
        
        [RACObserve(self.blog, shareCount) subscribeNext:^(id x) {
            @strongify(self);
            self.blogShareCountText = [NSString stringWithFormat:@"分享 %ld", self.blog.shareCount];
        }];
        
    }
    
    return self;
}

- (RACCommand *)likeBlogCommand {
    
    if (!_likeBlogCommand) {
        @weakify(self);
        
        _likeBlogCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            
            RACSubject *subject = [RACSubject subject];
            
            if (self.blog.isLiked) {
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    self.blog.isLiked = NO;
                    self.blog.likeCount -= 1;
                    [subject sendCompleted];
                });
                
            } else {
                
                
                self.blog.isLiked = YES;
                self.blog.likeCount += 1;
                [subject sendCompleted];
                
//                // 网络请求
//                [self.blogLikeApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//                    
//                    // ....
//                    [subject sendCompleted];
//                    
//                } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//                    
//                    self.blog.isLiked = NO;
//                    self.blog.likeCount -= 1;
//                    
//                    [subject sendError:request.error];
//                }];
            }
            
            return subject;
        }];
    }
    
    return _likeBlogCommand;
}

@end
