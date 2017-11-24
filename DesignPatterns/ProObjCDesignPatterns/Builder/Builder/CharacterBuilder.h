//
//  CharacterBuilder.h
//  Builder
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"


/**
 抽象构造器，定义了任何角色构造器都要有的接口
 */
@interface CharacterBuilder : NSObject

@property (nonatomic, strong, readonly) Character *character;



- (CharacterBuilder *)buildNewCharacter;
- (CharacterBuilder *)buildStrength:(float)value;
- (CharacterBuilder *)buildStamina:(float)value;
- (CharacterBuilder *)buildIntelligence:(float)value;
- (CharacterBuilder *)buildAgility:(float)value;
- (CharacterBuilder *)buildAggressiveness:(float)value;

@end
