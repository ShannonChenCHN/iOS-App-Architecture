//
//  SCUserDetailViewController.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCUser;


/**
 用户详情
 */
@interface SCUserDetailViewController : UIViewController

- (instancetype)initWithUser:(SCUser *)user;

@end
