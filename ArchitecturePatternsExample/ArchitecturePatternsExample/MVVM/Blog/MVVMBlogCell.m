//
//  MVVMBlogCell.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVVMBlogCell.h"
#import "UIView+HUD.h"

@interface MVVMBlogCell ()
    
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@end

@implementation MVVMBlogCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    @weakify(self);
    
    // UI 展示
    RAC(self.nameLabel, text) = RACObserve(self, cellModel.blogTitleText);
    RAC(self.summaryTextLabel, text) = RACObserve(self, cellModel.blogSummaryText);
    RAC(self.likeButton, selected) = [RACObserve(self, cellModel.isLiked) ignore:nil];
    
    [RACObserve(self, cellModel.blogLikeCountText) subscribeNext:^(NSString *title) {
       @strongify(self);
       
       [self.likeButton setTitle:title forState:UIControlStateNormal];
    }];
    
    
    [RACObserve(self, cellModel.blogShareCountText) subscribeNext:^(NSString *title) {
        @strongify(self);
        
        [self.shareButton setTitle:title forState:UIControlStateNormal];
    }];
    
    // 点赞
    [[self.likeButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        if (!self.cellModel.isLiked) {
            
            [[self.cellModel.likeBlogCommand execute:nil] subscribeError:^(NSError *error) {
                [self showToastWithText:error.domain];
            }];
        } else {
            
            [self showAlertWithTitle:@"提示" message:@"确定取消点赞吗?" confirmHandler:^(UIAlertAction *confirmAction) {
                [[self.cellModel.likeBlogCommand execute:nil] subscribeError:^(NSError *error) {
                    [self showToastWithText:error.domain];
                }];
            }];
        }
    }];
    
}


@end
