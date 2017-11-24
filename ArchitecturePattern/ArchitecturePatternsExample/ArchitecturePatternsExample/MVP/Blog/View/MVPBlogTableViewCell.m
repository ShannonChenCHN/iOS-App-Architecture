//
//  MVPBlogTableViewCell.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/22.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVPBlogTableViewCell.h"


@interface MVPBlogTableViewCell () <MVPBlogCellPresenterCallback>
    
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@end

@implementation MVPBlogTableViewCell
    


- (void)setPresenter:(MVPBlogCellPresenter *)presenter {
    _presenter = presenter;
    
    presenter.view = self;
    self.nameLabel.text = presenter.blogTitleText;
    self.summaryTextLabel.text = presenter.blogSummaryText;
    self.likeButton.selected = presenter.isLiked;
    [self.likeButton setTitle:presenter.blogLikeCountText forState:UIControlStateNormal];
    [self.shareButton setTitle:presenter.blogShareCountText forState:UIControlStateNormal];
    
}
    
#pragma mark - Action
- (IBAction)didSelectLikeButton:(id)sender {
    if (self.likeHandler) {
        self.likeHandler();
    }
}
    
- (IBAction)didSelectShareButton:(id)sender {
    
}
    
#pragma mark - MVPBlogCellPresenterCallback
    
- (void)blogPresenterDidUpdateLikeState:(MVPBlogCellPresenter *)presenter {
    
    [self.likeButton setTitle:presenter.blogLikeCountText forState:UIControlStateNormal];
    [self.likeButton setTitleColor:presenter.isLiked ? [UIColor redColor] : [UIColor blackColor] forState:UIControlStateNormal];
}
    
- (void)blogPresenterDidUpdateShareState:(MVPBlogCellPresenter *)presenter {
    [self.shareButton setTitle:presenter.blogShareCountText forState:UIControlStateNormal];
}


@end
