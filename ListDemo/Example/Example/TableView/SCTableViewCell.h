//
//  SCTableViewCell.h
//  Example
//
//  Created by ShannonChen on 2017/9/5.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCTableViewCellModel;

@interface SCTableViewCell : UITableViewCell

@property (strong, nonatomic) SCTableViewCellModel *model;

+ (CGFloat)tableView:(UITableView *)tableView cellHeightWithModel:(SCTableViewCellModel *)model;

@end
