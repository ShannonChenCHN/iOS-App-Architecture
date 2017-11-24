//
//  MVPBlogTableViewCell.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/22.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MVPBlogCellPresenter.h"

typedef void(^MVPBlogTableViewCellLikeHandler)();

/**
 展示博客列表的 cell
 */
@interface MVPBlogTableViewCell : UITableViewCell
    
@property (strong, nonatomic) MVPBlogCellPresenter *presenter;
@property (copy, nonatomic) MVPBlogTableViewCellLikeHandler likeHandler;
    
    
@end
