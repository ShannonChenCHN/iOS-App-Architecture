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

/*
 中介者模式：定义一个集中的场所，不同对象间的交互可以在一个中介者对象中处理。其他对象不必彼此交互，
           因此减少了它们之间的依存关系，减低耦合度。
 
 典型的应用场景就是 iOS 应用中用于处理页面跳转的路由系统。
 */
@interface CoordinatingController : NSObject

@property (nonatomic, strong, readonly) CanvasViewController *canvasViewController;
@property (nonatomic, strong, readonly) UIViewController *activeViewController;
    
+ (instancetype)sharedInstance;
- (void)requestViewTransitionWithTarget:(CoordinatingTarget)target params:(NSDictionary *)params;

@end
