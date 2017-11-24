//
//  OpenScribbleCommand.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "OpenScribbleCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"

@implementation OpenScribbleCommand

- (instancetype)initWithScribbleSource:(id <ScribbleSource>) aScribbleSource {
    if (self = [super init]) {
        [self setScribbleSource:aScribbleSource];
    }
    
    return self;
}

- (void)execute {
    
    // 读取涂鸦对象数据
    Scribble *scribble = [_scribbleSource scribble];
    
    // 设置给当前的 CanvasViewController
    CoordinatingController *coordinator = [CoordinatingController sharedInstance];
    CanvasViewController *controller = [coordinator canvasViewController];
    controller.scribble = scribble;
    
    // 告诉 coordinator 进行页面跳转
    [coordinator requestViewTransitionWithTarget:CoordinatingTargetCanvas params:nil];
}

@end
