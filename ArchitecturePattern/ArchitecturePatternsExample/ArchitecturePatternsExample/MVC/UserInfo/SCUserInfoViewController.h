//
//  SCUserInfoViewController.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/11.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCEventHandler.h"

/**
 用户信息模块的 controller
 */
@interface SCUserInfoViewController : UIViewController <SCEventHandler>
    
@property (copy, nonatomic) NSString *userId;

- (instancetype)initWithUserId:(NSString *)userId;
    
- (void)fetchDataWithCompletionHandler:(void(^)(NSError *error, id result))completion;

    
@end
