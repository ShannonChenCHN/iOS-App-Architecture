//
//  MVPDraftViewController.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/22.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MVPDraftViewController : UITableViewController

- (instancetype)initWithUserId:(NSString *)userId;
    
- (void)fetchDataWithCompletionHandler:(void(^)(NSError *error, id result))completion;

@end
