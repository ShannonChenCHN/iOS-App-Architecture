//
//  SCBlogTableViewCell.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCBlogTableViewCell.h"
#import "SCBlogCellModel.h"

@interface SCBlogTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@end

@implementation SCBlogTableViewCell

@synthesize eventHandler = _eventHandler;

- (void)setBlogTitle:(NSString *)title {
    self.nameLabel.text = title;
}

- (void)setSummaryText:(NSString *)text {
    self.summaryTextLabel.text = text;
}

- (void)setLikeState:(BOOL)isLiked {
    self.likeButton.selected = isLiked;
}


- (IBAction)didSelectLikeButton:(id)sender {
    if (self.eventHandler) {
        self.eventHandler(NSStringFromSelector(@selector(didSelectLikeButton:)), nil);
    }
}

- (IBAction)didSelectShareButton:(id)sender {
    if (self.eventHandler) {
        self.eventHandler(NSStringFromSelector(@selector(didSelectShareButton:)), nil);
    }
}


@end
