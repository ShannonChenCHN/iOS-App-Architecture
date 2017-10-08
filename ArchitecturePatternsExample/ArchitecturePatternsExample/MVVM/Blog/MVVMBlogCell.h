//
//  MVVMBlogCell.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVVMBlogCellModel.h"

@interface MVVMBlogCell : UITableViewCell

@property (strong, nonatomic) MVVMBlogCellModel *cellModel;

@end
