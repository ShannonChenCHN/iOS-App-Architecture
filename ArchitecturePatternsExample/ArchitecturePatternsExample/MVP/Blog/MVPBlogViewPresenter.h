//
//  MVPBlogViewPresenter.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/22.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCBlog.h"

@class MVPBlogViewPresenter, MVPBlogCellPresenter;

@protocol MVPBlogViewPresenterCallBack <NSObject>

- (void)blogViewPresenter:(MVPBlogViewPresenter *)presenter didRefreshDataWithResult:(id)result error:(NSError *)error;
- (void)blogViewPresenter:(MVPBlogViewPresenter *)presenter didLoadMoreDataWithResult:(id)result error:(NSError *)error;

@end


/**
 博客列表的 Presenter
 */
@interface MVPBlogViewPresenter : NSObject

@property (weak, nonatomic) id <MVPBlogViewPresenterCallBack> view;
    
@property (strong, nonatomic, readonly) NSMutableArray <MVPBlogCellPresenter *> *cellPresenters;

- (instancetype)initWithUserId:(NSString *)userId;

- (void)refreshData;
- (void)loadMoreData;

- (void)fetchDataWithCompletionHandler:(void(^)(NSError *error, id result))completion;

@end
