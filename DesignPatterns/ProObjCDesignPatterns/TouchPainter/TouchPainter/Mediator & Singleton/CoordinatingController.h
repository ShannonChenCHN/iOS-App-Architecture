//
//  CoordinatingController.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/30.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasViewController.h"
#import "PaletteViewController.h"
#import "ThumbnailViewController.h"


typedef NS_ENUM(NSInteger, CoordinatingTarget) {
    CoordinatingTargetDefault,
    CoordinatingTargetCanvas,
    CoordinatingTargetPalette,
    CoordinatingTargetThumbnail,
};

@interface CoordinatingController : NSObject

@property (nonatomic, strong, readonly) CanvasViewController *canvasViewController;
@property (nonatomic, strong, readonly) UIViewController *activeViewController;
    
+ (instancetype)sharedInstance;
- (void)requestViewTransitionWithTarget:(CoordinatingTarget)target params:(NSDictionary *)params;

@end
