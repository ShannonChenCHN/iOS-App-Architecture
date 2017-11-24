//
//  MVPBlogViewController.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/22.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MVPBlogViewPresenter.h"
#import "SCEventHandler.h"


@interface MVPBlogViewController : UITableViewController <SCEventHandler>

@property (strong, nonatomic) MVPBlogViewPresenter *presenter;


- (instancetype)initWithPresenter:(MVPBlogViewPresenter *)presenter;

@end
