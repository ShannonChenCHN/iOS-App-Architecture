//
//  BrandingFactory.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>


extern NSString * const BrandNameAcme;
extern NSString * const BrandNameSierra;

/**
 抽象工厂
 */
@interface BrandingFactory : NSObject

// 返回工厂实例的工厂方法
+ (instancetype)factoryWithBrand:(NSString *)brandName;


// 返回产品实例的工厂方法
- (UIView *)brandedViewWithFrame:(CGRect)frame;
- (UIButton *)brandedMainButtonWithFrame:(CGRect)frame;
- (UIToolbar *)brandedToolBarWithFrame:(CGRect)frame;

@end
