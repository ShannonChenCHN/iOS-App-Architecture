//
//  Command.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/30.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Command : NSObject

@property (nonatomic, strong) NSDictionary *userInfo;

- (void)execute;
- (void)undo;

@end
