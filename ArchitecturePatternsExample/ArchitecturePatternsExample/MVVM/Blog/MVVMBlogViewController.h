//
//  MVVMBlogViewController.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVVMBlogViewModel.h"

@interface MVVMBlogViewController : UITableViewController

@property (strong, nonatomic) MVVMBlogViewModel *viewModel;

@property (strong, nonatomic, readonly) RACCommand *dataFetchingCommand;
@property (strong, nonatomic) RACCommand *tableViewRowSelectedCommand;

- (instancetype)initWithViewModel:(MVVMBlogViewModel *)viewModel;

@end
