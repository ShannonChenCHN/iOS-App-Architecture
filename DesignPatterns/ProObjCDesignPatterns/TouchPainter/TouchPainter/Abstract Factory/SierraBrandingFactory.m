//
//  SierraBrandingFactory.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SierraBrandingFactory.h"
#import "SierraView.h"
#import "SierraMainButton.h"
#import "SierraToolBar.h"

@implementation SierraBrandingFactory

- (UIView *)brandedViewWithFrame:(CGRect)frame {
    return [[SierraView alloc] initWithFrame:frame];
}

- (UIButton *)brandedMainButtonWithFrame:(CGRect)frame {
    return [[SierraMainButton alloc] initWithFrame:frame];
}

- (UIToolbar *)brandedToolBarWithFrame:(CGRect)frame {
    return [[SierraToolBar alloc] initWithFrame:frame];
}

@end
