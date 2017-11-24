//
//  AcmeBrandingFactory.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "AcmeBrandingFactory.h"
#import "AcmeView.h"
#import "AcmeMainButton.h"
#import "AcmeToolBar.h"

@implementation AcmeBrandingFactory

- (UIView *)brandedViewWithFrame:(CGRect)frame {
    return [[AcmeView alloc] initWithFrame:frame];
}

- (UIButton *)brandedMainButtonWithFrame:(CGRect)frame {
    return [[AcmeMainButton alloc] initWithFrame:frame];
}

- (UIToolbar *)brandedToolBarWithFrame:(CGRect)frame {
    return [[AcmeToolBar alloc] initWithFrame:frame];
}

@end
