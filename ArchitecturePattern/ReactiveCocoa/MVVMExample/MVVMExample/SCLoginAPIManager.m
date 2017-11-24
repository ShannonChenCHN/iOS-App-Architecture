//
//  SCLoginAPIManager.m
//  MVVMExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCLoginAPIManager.h"

@implementation SCLoginAPIManager

- (void)startRequestWithCompletion:(SCRequestCompletionHandler)completion {

    self.isLoading = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        self.isLoading = NO;
        
        if (completion) {
            completion(YES, self.user);
        }
    });
}

@end
