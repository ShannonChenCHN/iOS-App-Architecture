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
 */
@interface SCBlogTableViewCell : UITableViewCell <SCEventHandler>

- (void)setBlogTitle:(NSString *)title;

- (void)setSummaryText:(NSString *)text;

- (void)setLikeState:(BOOL)isLiked;

@end
