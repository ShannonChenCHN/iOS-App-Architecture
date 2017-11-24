//
//  ReubenSandwich.m
//  TemplateMethod
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ReubenSandwich.h"

@implementation ReubenSandwich


- (void) prepareBread {
    [self cutRyeBread];
}

- (void) addMeat {
    [self addCornBeef];
}

- (void) addCondiments {
    [self addSauerkraut];
    [self addThousandIslandDressing];
    [self addSwissCheese];
}

- (void) extraStep {
    [self grillIt];
}

#pragma mark -
#pragma mark ReubenSandwich Specific Methods

- (void) cutRyeBread {
    
}

- (void) addCornBeef {
    // ... add tons of corn beef
}

- (void) addSauerkraut {
    // ... and sauerkraut.
}

- (void) addThousandIslandDressing {
    // ... don't forget to put Thousand Island dressing
}

- (void) addSwissCheese {
    // ... as well as some good Swiss cheese.
}

- (void) grillIt {
    // finally it needs to be toasted.
}

@end
