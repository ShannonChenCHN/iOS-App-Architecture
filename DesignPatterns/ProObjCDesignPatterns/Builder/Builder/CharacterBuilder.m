//
//  CharacterBuilder.m
//  Builder
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "CharacterBuilder.h"

@interface CharacterBuilder ()

@property (nonatomic, strong, readwrite) Character *character;

@end

@implementation CharacterBuilder


- (CharacterBuilder *)buildNewCharacter {
    
    _character = [[Character alloc] init];
    
    return self;
}

- (CharacterBuilder *)buildStrength:(float)value {
    self.character.strength = value;
    
    return self;
}

- (CharacterBuilder *)buildStamina:(float)value {
    self.character.stamina = value;
    
    return self;
}

- (CharacterBuilder *)buildIntelligence:(float)value {
    self.character.intelligence = value;
    
    return self;
}

- (CharacterBuilder *)buildAgility:(float)value {
    self.character.agility = value;
    
    return self;
}

- (CharacterBuilder *)buildAggressiveness:(float)value {
    self.character.aggressiveness = value;
    
    return self;
}


@end
