//
//  SaveScribbleCommand.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SaveScribbleCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"
#import "UIView+Snapshot.h"
#import "ScribbleManager.h"

@implementation SaveScribbleCommand

- (void)execute {
    
    // 从当前的 canvasViewController 中获取必要的信息
    CoordinatingController *coordinatingController = [CoordinatingController sharedInstance];
    CanvasViewController *canvasViewController = [coordinatingController canvasViewController];
    UIImage *canvasViewImage = [canvasViewController.canvasView snapshotImage];
    Scribble *scribble = [canvasViewController scribble];
    
    // 创建 ScribbleManager 保存 scribble
    ScribbleManager *scribbleManager = [[ScribbleManager alloc] init];
    [scribbleManager saveScribble:scribble thumbnail:canvasViewImage];
    
    // 保存成功的提示
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Your scribble is saved"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}


@end
