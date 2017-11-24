//
//  SCBlogTableViewController.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/11.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCEventHandler.h"

/**
 博客模块的 controller
 */
@interface SCBlogTableViewController : UITableViewController <SCEventHandler>
    
    
@property (copy, nonatomic) NSString *userId;

- (instancetype)initWithUserId:(NSString *)userId;

- (void)fetchDataWithCompletionHandler:(void(^)(NSError *error, id result))completion;

@end
