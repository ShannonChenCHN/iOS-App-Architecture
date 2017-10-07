//
//  SCEventHandler.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SCEventHandler)(NSString *eventId, id params);

@protocol SCEventHandler <NSObject>

@property (copy, nonatomic) SCEventHandler eventHandler;

@end
