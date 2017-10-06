//
//  SCBlogTableViewCell.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCEventHandler.h"


/**
 博客列表 cell
 注：这里暴露的 API 全部都是解耦的 set 方法，而不是与 model 耦合的 setModel 方法
 */
@interface SCBlogTableViewCell : UITableViewCell <SCEventHandler>

- (void)setBlogTitle:(NSString *)title;

- (void)setSummaryText:(NSString *)text;

- (void)setLikeState:(BOOL)isLiked;

@end
