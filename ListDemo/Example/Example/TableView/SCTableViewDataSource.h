//
//  SCTableViewDataSource.h
//  Example
//
//  Created by ShannonChen on 2017/9/4.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SCTableViewCellModel;


/**
 针对 UITableViewDataSource 的扩展
 */
@protocol SCTableViewDataSource <UITableViewDataSource>

@optional

- (SCTableViewCellModel *)tableView:(UITableView *)tableView modelForRowAtIndexPath:(NSIndexPath *)indexPath;
- (Class)tableView:(UITableView*)tableView cellClassForModel:(SCTableViewCellModel *)model;

@end



/**
 每个 cell 对应的数据源
 */
@interface SCTableViewCellModel : NSObject

@property (copy, nonatomic) NSString *cellIdentifier;
@property (copy, nonatomic) NSString *title;

@end



/**
 每个 section 对应的数据源
 */
@interface SCTableViewSectionModel : NSObject

@property (copy, nonatomic) NSString *headerTitle;

@property (strong, nonatomic) NSArray <SCTableViewCellModel *> *cellModels;

@property (copy, nonatomic) NSString *footerTitle;

@end


/**
 table view 的数据源
 */
@interface SCTableViewDataSource : NSObject <SCTableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray <SCTableViewSectionModel *> *sectionModels;

@end
