//
//  MVVMBlogCellModel.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

#import "SCBlog.h"

@interface MVVMBlogCellModel : NSObject

// UI 展示
@property (assign, nonatomic) BOOL isLiked;
@property (copy, nonatomic) NSString *blogTitleText;
@property (copy, nonatomic) NSString *blogSummaryText;
@property (copy, nonatomic) NSString *blogLikeCountText;
@property (copy, nonatomic) NSString *blogShareCountText;

// 交互逻辑
@property (strong, nonatomic) RACCommand *likeBlogCommand;
@property (strong, nonatomic) RACCommand *shareBlogCommand;

// 其他数据
@property (strong, nonatomic) SCBlog *blog;


- (instancetype)initWithBlog:(SCBlog *)blog;

@end
