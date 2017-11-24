//
//  CanvasViewController.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/28.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"
#import "CanvasView.h"

@interface CanvasViewController : UIViewController

@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeSize;

@property (strong, nonatomic) Scribble *scribble;
@property (nonatomic, strong, readonly) CanvasView *canvasView;

@end

