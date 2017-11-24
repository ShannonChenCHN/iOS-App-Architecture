//
//  MVPDraftViewController.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/22.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MVPDraftViewPresenter.h"

@interface MVPDraftViewController : UITableViewController

- (instancetype)initWithPresenter:(MVPDraftViewPresenter *)presenter;
    
- (void)fetchDataWithCompletionHandler:(void(^)(NSError *error, id result))completion;

@end
