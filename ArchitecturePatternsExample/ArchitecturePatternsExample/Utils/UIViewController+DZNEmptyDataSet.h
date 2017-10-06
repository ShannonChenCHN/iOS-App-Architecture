//
//  UIViewController+DZNEmptyDataSet.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/6.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIScrollView+EmptyDataSet.h>

@interface UIViewController (DZNEmptyDataSet) <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end
