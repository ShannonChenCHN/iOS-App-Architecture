//
//  ChasingGame.m
//  Builder
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ChasingGame.h"

@implementation ChasingGame


- (Character *)createPlayerWithBuilder:(CharacterBuilder *)builder {
    
    [builder buildNewCharacter];
    [builder buildStrength:50.0];
    [builder buildStamina:25.0];
    [builder buildIntelligence:75.0];
    [builder buildAgility:65.0];
    [builder buildAggressiveness:35.0];
    
    
    return builder.character;
    
}

- (Character *)createEnemyWithBuilder:(CharacterBuilder *)builder {
    
    [[[[[[builder buildNewCharacter]
         buildStrength:80.0]
         buildStamina:65.0]
         buildIntelligence:35.0]
         buildAgility:25.0]
         buildAggressiveness:95.0];
    
    // 或者
//    [builder buildStrength:80.0];
//    [builder buildStamina:65.0];
//    [builder buildIntelligence:35.0];
//    [builder buildAgility:25.0];
//    [builder buildAggressiveness:95.0];
    
    
    return builder.character;
}

@end
