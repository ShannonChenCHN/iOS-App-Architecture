//
//  YHLoginViewController.h
//  URLRouter
//
//  Created by ShannonChen on 2018/4/13.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHLoginViewController : UIViewController

@property (nonatomic, copy) void (^completionHandler)(BOOL success);

@end
