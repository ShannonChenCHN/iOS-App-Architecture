//
//  MVVMBlogViewModel.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MVVMBlogCellModel.h"

@interface MVVMBlogViewModel : NSObject

// 业务逻辑
@property (strong, nonatomic) RACSignal *refreshDataSignal;
@property (strong, nonatomic) RACSignal *loadMoreDataSignal;


// UI 展示
@property (strong, nonatomic, readonly) NSMutableArray <MVVMBlogCellModel *> *cellModels;

- (instancetype)initWithUserId:(NSString *)userId;

@end
