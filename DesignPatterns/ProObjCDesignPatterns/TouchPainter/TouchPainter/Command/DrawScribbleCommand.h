//
//  DrawScribbleCommand.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/19.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Command.h"

extern NSString * const ScribbleObjectUserInfoKey;
extern NSString * const MarkObjectUserInfoKey;
extern NSString * const AddToPreviousMarkUserInfoKey;

@interface DrawScribbleCommand : Command

@end
