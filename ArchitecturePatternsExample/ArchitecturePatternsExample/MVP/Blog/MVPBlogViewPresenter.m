//
//  MVPBlogViewPresenter.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/22.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVPBlogViewPresenter.h"
#import "SCBlogListAPIManger.h"
#import "MVPBlogCellPresenter.h"

@interface MVPBlogViewPresenter ()

@property (copy, nonatomic) NSString *userId;

@property (strong, nonatomic) SCBlogListAPIManger *blogListAPIManager;

@property (strong, nonatomic, readwrite) NSMutableArray <MVPBlogCellPresenter *> *cellPresenters;

@end

@implementation MVPBlogViewPresenter

- (instancetype)initWithUserId:(NSString *)userId {
    if (self = [super init]) {
        
        _userId = userId;
        _cellPresenters = [NSMutableArray array];
        _blogListAPIManager = [[SCBlogListAPIManger alloc] initWithUserId:userId];
    }
    
    return self;
}



- (void)fetchDataWithCompletionHandler:(void (^)(NSError *, id))completion {
    [self.blogListAPIManager startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        
        if (completion) {
            completion(nil, request.responseObject);
        }
        
        // 通知绑定的 view 层
        if ([self.view respondsToSelector:@selector(blogViewPresenter:didRefreshDataWithResult:error:)]) {
            [self.view blogViewPresenter:self didRefreshDataWithResult:request.responseObject error:nil];
        }
        
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        // 提供格式化好的数据给 View（测试数据）
        [self.cellPresenters removeAllObjects];
        
        for (int i = 0; i < 20; i ++) {
            SCBlog *blog = [[SCBlog alloc] initWithBlogId:[NSString stringWithFormat:@"%i", i]];
            MVPBlogCellPresenter *cellPresenter = [[MVPBlogCellPresenter alloc] initWithBlog:blog];
            [self.cellPresenters addObject:cellPresenter];
        }
        
        
        if (completion) {
            completion(request.error, nil);
        }
        
        // 通知绑定的 view 层
        if ([self.view respondsToSelector:@selector(blogViewPresenter:didRefreshDataWithResult:error:)]) {
            [self.view blogViewPresenter:self didRefreshDataWithResult:nil error:request.error];
        }
    }];
}

- (void)refreshData {
    [self fetchDataWithCompletionHandler:nil];
}

- (void)loadMoreData {
    // ....
}

@end
