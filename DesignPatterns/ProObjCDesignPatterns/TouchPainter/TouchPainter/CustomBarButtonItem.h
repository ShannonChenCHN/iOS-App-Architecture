//
//  CustomBarButtonItem.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Command.h"

@interface CustomBarButtonItem : UIBarButtonItem

@property (strong, nonatomic) Command *command;

@end
