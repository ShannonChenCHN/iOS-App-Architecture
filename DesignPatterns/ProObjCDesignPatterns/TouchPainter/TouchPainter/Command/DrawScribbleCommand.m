//
//  DrawScribbleCommand.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/19.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "DrawScribbleCommand.h"
#import "Scribble.h"

NSString * const ScribbleObjectUserInfoKey = @"ScribbleObjectUserInfoKey";
NSString * const MarkObjectUserInfoKey = @"MarkObjectUserInfoKey";
NSString * const AddToPreviousMarkUserInfoKey = @"AddToPreviousMarkUserInfoKey";

@interface DrawScribbleCommand ()

@property (nonatomic, strong) Scribble *scribble;
@property (nonatomic, strong) id <Mark> mark;
@property (nonatomic, assign) BOOL shouldAddToPreviousMark;

@end

@implementation DrawScribbleCommand

- (void)execute {
    if (self.userInfo == nil) {
        return;
    }
    
    self.scribble = self.userInfo[ScribbleObjectUserInfoKey];
    self.mark = self.userInfo[MarkObjectUserInfoKey];
    self.shouldAddToPreviousMark = [self.userInfo[AddToPreviousMarkUserInfoKey] boolValue];
    
    [self.scribble addMark:self.mark shouldAddToPreviousMark:self.shouldAddToPreviousMark];
    
}

- (void)undo {
    [self.scribble removeMark:self.mark];
}

@end
