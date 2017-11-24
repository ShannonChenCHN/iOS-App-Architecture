//
//  MVVMUserInfoViewController.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVVMUserInfoViewModel.h"

@interface MVVMUserInfoViewController : UIViewController

@property (strong, nonatomic) MVVMUserInfoViewModel *viewModel;
@property (strong, nonatomic) RACCommand *avatarSelectedCommand;

- (instancetype)initWithViewModel:(MVVMUserInfoViewModel *)viewModel;

@end
