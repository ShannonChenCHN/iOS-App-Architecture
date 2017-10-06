//
//  UIViewController+DZNEmptyDataSet.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/6.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "UIViewController+DZNEmptyDataSet.h"

@implementation UIViewController (DZNEmptyDataSet)
    
#pragma mark - <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
    
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = @"这里空空如也~";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
    
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIColor whiteColor];
}

@end
