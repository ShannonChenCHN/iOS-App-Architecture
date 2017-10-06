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

@property (strong, nonatomic) NSMutableArray <MVPBlogCellPresenter *> *cellPresenters;

@end

@implementation MVPBlogViewPresenter

- (instancetype)initWithUserId:(NSString *)userId {
    if (self = [super init]) {
        
        _userId = userId;
    }
    
    return self;
}



- (void)fetchDataWithCompletionHandler:(void (^)(NSError *, id))completion {
    
}

- (void)refreshData {
    
}

- (void)loadMoreData {
    
}

@end
