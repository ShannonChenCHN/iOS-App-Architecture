//
//  SCTableView.h
//  Example
//
//  Created by ShannonChen on 2017/9/5.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCTableViewDataSource.h"


/**
 定义了一些代理方法，用于中转系统的代理
 */
@protocol SCTableViewDelegate <UITableViewDelegate>

@optional

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath withModel:(SCTableViewCellModel *)model;
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section withModel:(SCTableViewSectionModel *)model;


@end

@interface SCTableView : UITableView <UITableViewDelegate>

@property (weak, nonatomic) id <SCTableViewDelegate> customDelegate;
@property (weak, nonatomic) id <SCTableViewDataSource> customDataSource;

@end
