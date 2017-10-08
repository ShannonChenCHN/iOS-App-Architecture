//
//  MVVMUserInfoViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVVMUserInfoViewController.h"
#import <ReactiveCocoa.h>
#import <UIButton+WebCache.h>

@interface MVVMUserInfoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *avatarView;

@end

@implementation MVVMUserInfoViewController


- (instancetype)initWithViewModel:(MVVMUserInfoViewModel *)viewModel {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _viewModel = viewModel;
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.avatarView.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self bindViewModel];
    
}

- (void)bindViewModel {
    
    
    @weakify(self);
    
    // UI 展示
    RAC(self.nameLabel, text) = RACObserve(self.viewModel, username);
    [RACObserve(self.viewModel, avatarURLString) subscribeNext:^(NSString *urlString) {
        @strongify(self);
        [self.avatarView sd_setImageWithURL:[NSURL URLWithString:urlString] forState:UIControlStateNormal];
    }];
    
    // 点击头像
    [[self.avatarView rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        [self.avatarSelectedCommand execute:self.viewModel.user];
    }];
    
}

@end
