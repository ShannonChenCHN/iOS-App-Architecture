//
//  FlowerFactory.h
//  Flyweight
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTotalNumberOfFlowerTypes    6

typedef NS_ENUM(NSInteger, FlowerType) {
    FlowerTypeAnemone,
    FlowerTypeCosmos,
    FlowerTypeGerberas,
    FlowerTypeHollyhock,
    FlowerTypeJasmine,
    FlowerTypeZinnia,
};


/**
 享元工厂
 */
@interface FlowerFactory : NSObject

- (UIView *)flowerViewWithType:(FlowerType)type;

@end
