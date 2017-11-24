//
//  MVVMBlogViewModel.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVVMBlogViewModel.h"

#import "SCBlogListAPIManger.h"
#import "SCBlog.h"

@interface MVVMBlogViewModel ()
    
@property (copy, nonatomic) NSString *userId;

@property (strong, nonatomic) SCBlogListAPIManger *blogListAPIManager;

@property (strong, nonatomic, readwrite) NSMutableArray <MVVMBlogCellModel *> *cellModels;

@end

@implementation MVVMBlogViewModel

- (instancetype)initWithUserId:(NSString *)userId {
    if (self = [super init]) {
        
        _userId = userId;
        _cellModels = [NSMutableArray array];
        _blogListAPIManager = [[SCBlogListAPIManger alloc] initWithUserId:userId];
        
        
    }
    
    return self;
}


- (RACSignal *)refreshDataSignal {

    if (!_refreshDataSignal) {
    
        _refreshDataSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
           
           [self.blogListAPIManager startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
               
               [subscriber sendCompleted];
               
           } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
           
               
//               [subscriber sendError:request.error];
               
#warning 实际上应该是 sendError，这里为了模拟数据，所以做了处理
               // 提供格式化好的数据给 View（测试数据）
               [self.cellModels removeAllObjects];
               
               for (int i = 0; i < 20; i ++) {
                   SCBlog *blog = [[SCBlog alloc] initWithBlogId:[NSString stringWithFormat:@"%i", i]];
                   MVVMBlogCellModel *cellModel = [[MVVMBlogCellModel alloc] initWithBlog:blog];
                   [self.cellModels addObject:cellModel];
               }
               
               [subscriber sendCompleted];
               
           }];
           
            return nil;
        }];
    }
    
    return _refreshDataSignal;
}


- (RACSignal *)loadMoreDataSignal {

    if (!_loadMoreDataSignal) {
    
        _loadMoreDataSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            // ... 暂时没有数据
            [subscriber sendCompleted];
            
            return nil;
        }];
    }
    
    return _loadMoreDataSignal;
}

@end
