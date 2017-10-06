//
//  MVPBlogViewController.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/22.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MVPBlogViewPresenter.h"

@protocol MVPBlogViewControllerEventHandler <NSObject>

- (void)blogViewController:(UIViewController *)controller didSelectBlog:(SCBlog *)blog atIndex:(NSInteger)index;

@end

@interface MVPBlogViewController : UITableViewController


@property (weak, nonatomic) id<MVPBlogViewControllerEventHandler> delegate;

- (instancetype)initWithPresenter:(MVPBlogViewPresenter *)presenter;

- (MVPBlogViewPresenter *)presenter;

@end
