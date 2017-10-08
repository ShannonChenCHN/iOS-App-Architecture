//
//  MVVMDraftViewController.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVVMDraftViewModel.h"

@interface MVVMDraftViewController : UITableViewController

- (instancetype)initWithViewModel:(MVVMDraftViewModel *)viewModel;

@end
