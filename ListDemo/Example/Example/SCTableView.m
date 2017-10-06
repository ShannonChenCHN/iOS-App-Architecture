//
//  SCTableView.m
//  Example
//
//  Created by ShannonChen on 2017/9/5.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCTableView.h"
#import "SCTableViewCell.h"

@implementation SCTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        self.delegate = self;
    }
    
    return self;
}

- (void)setCustomDataSource:(id<SCTableViewDataSource>)customDataSource {
    _customDataSource = customDataSource;
    
    self.dataSource = customDataSource;
}


#pragma mark - <UITableViewDelegate>

// Model 决定内容，Cell 决定展示
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SCTableViewCellModel *model = [self.customDataSource tableView:tableView modelForRowAtIndexPath:indexPath];
    Class cellClass = [self.customDataSource tableView:tableView cellClassForModel:model];
    
    return [cellClass tableView:tableView cellHeightWithModel:model];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if ([self.customDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:withModel:)]) {
        
        SCTableViewCellModel *model = [self.customDataSource tableView:tableView modelForRowAtIndexPath:indexPath];
        [self.customDelegate tableView:tableView didSelectRowAtIndexPath:indexPath withModel:model];
        
    }
}

@end
