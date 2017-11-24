//
//  BrandingFactory.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "BrandingFactory.h"
#import "AcmeBrandingFactory.h"
#import "SierraBrandingFactory.h"

NSString * const BrandNameAcme = @"Acme";
NSString * const BrandNameSierra = @"Sierra";

@implementation BrandingFactory

+ (instancetype)factoryWithBrand:(NSString *)brandName {

    if ([brandName isEqualToString:BrandNameAcme]) {
    
        return [[AcmeBrandingFactory alloc] init];
        
    } else if ([brandName isEqualToString:BrandNameSierra]) {
        
        return [[SierraBrandingFactory alloc] init];
        
    } else {
        return nil;
    }

}

- (UIView *)brandedViewWithFrame:(CGRect)frame {
    return nil;
}

- (UIToolbar *)brandedToolBarWithFrame:(CGRect)frame {
    return nil;
}


- (UIButton *)brandedMainButtonWithFrame:(CGRect)frame {
    return nil;
}

@end
