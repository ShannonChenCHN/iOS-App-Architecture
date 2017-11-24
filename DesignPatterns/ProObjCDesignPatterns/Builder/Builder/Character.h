//
//  Character.h
//  Builder
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>



/**
 游戏角色
 */
@interface Character : NSObject

@property (nonatomic, assign) float protection;  // 防御
@property (nonatomic, assign) float power;       // 攻击

@property (nonatomic, assign) float strength;       // 力量
@property (nonatomic, assign) float stamina;        // 耐力
@property (nonatomic, assign) float intelligence;   // 智力
@property (nonatomic, assign) float agility;        // 敏捷
@property (nonatomic, assign) float aggressiveness; // 攻击力

@end
