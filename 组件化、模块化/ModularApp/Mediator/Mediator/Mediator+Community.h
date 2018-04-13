//
//  Mediator+Community.h
//  Mediator
//
//  Created by ShannonChen on 2018/4/13.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "Mediator.h"

@interface Mediator (Community)

+ (UIViewController *)eventDetailViewControllerWithId:(NSString *)eventId;
+ (UIViewController *)eventListViewController;

@end
