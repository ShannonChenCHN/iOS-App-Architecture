//
//  DeleteScribbleCommand.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "DeleteScribbleCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"

@implementation DeleteScribbleCommand

- (void) execute {
    // 获取当前的 canvasViewController
    CoordinatingController *coordinatingController = [CoordinatingController sharedInstance];
    CanvasViewController *canvasViewController = [coordinatingController canvasViewController];
    
    // 创建新的 scribble，覆盖掉原来的 scribble
    Scribble *newScribble = [[Scribble alloc] init];
    [canvasViewController setScribble:newScribble];
}

@end
