//
//  MVPBlogCellPresenter.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/22.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCBlog.h"

@class MVPBlogCellPresenter;

@protocol MVPBlogCellPresenterCallback <NSObject>

@optional
- (void)blogPresenterDidUpdateLikeState:(MVPBlogCellPresenter *)presenter;
- (void)blogPresenterDidUpdateShareState:(MVPBlogCellPresenter *)presenter;


@end



/**
 博客列表 cell 的 presenter
 */
@interface MVPBlogCellPresenter : NSObject
    
@property (weak, nonatomic) id <MVPBlogCellPresenterCallback> view;
    
- (instancetype)initWithBlog:(SCBlog *)blog;
    
- (SCBlog *)blog;
    
- (BOOL)isLiked;
- (NSString *)blogTitleText;
- (NSString *)blogSummaryText;
- (NSString *)blogLikeCountText;
- (NSString *)blogShareCountText;
    
    
- (void)likeBlogWithCompletionHandler:(void (^)(NSError *error, id result))completionHandler;
- (void)shareBlogWithCompletionHandler:(void (^)(NSError *error, id result))completionHandler;

@end
