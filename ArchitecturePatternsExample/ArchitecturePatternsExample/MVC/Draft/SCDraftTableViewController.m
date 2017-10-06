//
//  SCDraftTableViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/11.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCDraftTableViewController.h"

@interface SCDraftTableViewController ()

@end

@implementation SCDraftTableViewController

@synthesize eventHandler = _eventHandler;

- (instancetype)initWithUserId:(NSString *)userId {
    
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        _userId = userId;
        
    }
    
    return self;
}
    
- (void)fetchDataWithCompletionHandler:(void (^)(NSError *, id))completion {
    
}

@end
