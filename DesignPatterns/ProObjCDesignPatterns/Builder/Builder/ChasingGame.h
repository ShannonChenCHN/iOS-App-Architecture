//
//  ChasingGame.h
//  Builder
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StandardCharacterBuilder.h"

/**
 指导者 Director
 */
@interface ChasingGame : NSObject

- (Character *)createPlayerWithBuilder:(CharacterBuilder *)builder;
- (Character *)createEnemyWithBuilder:(CharacterBuilder *)builder;

@end
