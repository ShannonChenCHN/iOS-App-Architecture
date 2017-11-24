//
//  SetStrokeColorCommand.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/30.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SetStrokeColorCommand.h"
#import "CanvasViewController.h"
#import "CoordinatingController.h"

@implementation SetStrokeColorCommand

- (void)execute {
    CGFloat redValue = 0.0;
    CGFloat greenValue = 0.0;
    CGFloat blueValue = 0.0;
    
    [self.delegate command:self didRequestColorComponentsForRed:&redValue green:&greenValue blue:&blueValue];
    
    UIColor *color = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0];
    
    CoordinatingController *coordinator = [CoordinatingController sharedInstance];
    CanvasViewController *canvasVC = coordinator.canvasViewController;
    canvasVC.strokeColor = color;
    
    
    [self.delegate command:self didFinishColorUpdateWithColor:color];
}

@end
