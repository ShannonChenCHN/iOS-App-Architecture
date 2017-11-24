//
//  ExtrinsicFlowerState.h
//  Flyweight
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 用于表示每朵花的信息的类
 */
@interface ExtrinsicFlowerState : NSObject

@property (strong, nonatomic) UIView *flowerView;
@property (assign, nonatomic) CGRect area;


@end
