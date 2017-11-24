//
//  CoordinatingController.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/30.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "CoordinatingController.h"

@interface CoordinatingController ()
    
@property (nonatomic, strong) CanvasViewController *canvasViewController;
@property (nonatomic, strong) UIViewController *activeViewController;
@property (nonatomic, strong) UINavigationController *rootNavigationController;
    
@end

@implementation CoordinatingController

#pragma mark - Singleton
+ (instancetype)sharedInstance {
    static CoordinatingController *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sharedInstance == nil) {
            sharedInstance = [[super allocWithZone:NULL] init];
        }
    });
    
    return sharedInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}
    
- (instancetype)init {
    if (self = [super init]) {
        
        UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
        if ([rootViewController isKindOfClass:[UINavigationController class]]) {
            
            _rootNavigationController = (UINavigationController *)rootViewController;
            if (_rootNavigationController.viewControllers.count &&
                [_rootNavigationController.viewControllers.firstObject isKindOfClass:[CanvasViewController class]]) {
                _canvasViewController = (CanvasViewController *)_rootNavigationController.viewControllers.firstObject;
            }
        }
        
        _activeViewController = _canvasViewController;
    }
    return self;
}

#pragma mark - View transition
- (void)requestViewTransitionWithTarget:(CoordinatingTarget)target params:(NSDictionary *)params {
    switch (target) {
        case CoordinatingTargetPalette: {
            
            PaletteViewController *vc = [[PaletteViewController alloc] initWithNibName:@"PaletteViewController" bundle:nil];
            vc.strokeColor = params[@"strokeColor"];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
            [self.rootNavigationController presentViewController:navigationController animated:YES completion:NULL];
            
            self.activeViewController = vc;
        
        }
        break;
        
        case CoordinatingTargetThumbnail: {
            ThumbnailViewController *vc = [[ThumbnailViewController alloc] init];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
            [self.rootNavigationController presentViewController:navigationController animated:YES completion:NULL];
            
            self.activeViewController = vc;
        }
        
        break;
        
        
        case CoordinatingTargetDefault:
        case CoordinatingTargetCanvas:
        default: {
            if (self.rootNavigationController.presentedViewController) {
                [self.rootNavigationController.presentedViewController dismissViewControllerAnimated:YES completion:nil];
            }
            
            self.activeViewController = self.canvasViewController;
        }
        break;
    }
}



@end
