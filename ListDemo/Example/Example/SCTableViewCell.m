//
//  SCTableViewCell.m
//  Example
//
//  Created by ShannonChen on 2017/9/5.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCTableViewCell.h"
#import "SCTableViewDataSource.h"

@implementation SCTableViewCell

- (void)setModel:(SCTableViewCellModel *)model {
    _model = model;
    
    self.textLabel.text = model.title;
}

+ (CGFloat)tableView:(UITableView *)tableView cellHeightWithModel:(SCTableViewCellModel *)model {
    return 44;
}
@end
