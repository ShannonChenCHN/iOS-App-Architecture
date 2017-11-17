//
//  SCTableViewDataSource.m
//  Example
//
//  Created by ShannonChen on 2017/9/4.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCTableViewDataSource.h"
#import "SCTableViewCell.h"


@implementation SCTableViewCellModel



@end


@implementation SCTableViewSectionModel



@end


//////////////////////////////////////////////////////////////////////

@interface SCTableViewDataSource () 

@end

@implementation SCTableViewDataSource


#pragma mark - <SCTableViewDataSource>

- (SCTableViewCellModel *)tableView:(UITableView *)tableView modelForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.sectionModels.count > indexPath.section &&
        self.sectionModels[indexPath.section].cellModels.count > indexPath.row) {
        
        return self.sectionModels[indexPath.section].cellModels[indexPath.row];
    }
    
    return nil;
}


- (Class)tableView:(UITableView *)tableView cellClassForModel:(SCTableViewCellModel *)model {
    // 这里返回默认 cell 类型
    return [SCTableViewCell class];
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.sectionModels.count > section) {
        return self.sectionModels[section].cellModels.count;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.sectionModels.count > indexPath.section &&
        self.sectionModels[indexPath.section].cellModels.count > indexPath.row) {
        
        SCTableViewCellModel *model = self.sectionModels[indexPath.section].cellModels[indexPath.row];
        
        SCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellIdentifier];
        if (!cell) {
            Class cellClass = [self tableView:tableView cellClassForModel:model];
            cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:model.cellIdentifier];
        }
        
        cell.model = model;
        
        return cell;
        
    }
    
    return [UITableViewCell new];
}


@end
