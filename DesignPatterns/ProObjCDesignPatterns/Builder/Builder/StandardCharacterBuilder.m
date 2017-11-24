//
//  StandardCharacterBuilder.m
//  Builder
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "StandardCharacterBuilder.h"

@implementation StandardCharacterBuilder

- (CharacterBuilder *)buildStrength:(float)value {
    
    self.character.protection *= value;
    self.character.power *= value;
    
    return [super buildStrength:value];
}

- (CharacterBuilder *)buildStamina:(float)value {
    
    self.character.protection *= value;
    self.character.power *= value;
    
    return [super buildStamina:value];
}

- (CharacterBuilder *)buildIntelligence:(float)value {
    self.character.protection *= value;
    self.character.power /= value;
    
    return [super buildIntelligence:value];
}

- (CharacterBuilder *)buildAgility:(float)value {
    self.character.protection *= value;
    self.character.power /= value;
    
    return [super buildAgility:value];
}

- (CharacterBuilder *)buildAggressiveness:(float)value {
    self.character.protection /= value;
    self.character.power *= value;
    
    return [super buildAggressiveness:value];
}


@end
