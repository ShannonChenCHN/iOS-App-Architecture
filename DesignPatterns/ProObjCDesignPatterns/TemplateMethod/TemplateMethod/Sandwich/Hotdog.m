//
//  Hotdog.m
//  TemplateMethod
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Hotdog.h"

@implementation Hotdog


- (void) prepareBread {
    [self getHotdogBun];
}

- (void) addMeat {
    [self addWiener];
}

- (void) addCondiments {
    [self addKetchup];
    [self addMustard];
    [self addOnion];
}

#pragma mark -
#pragma mark Hotdog Specific Methods

- (void) getHotdogBun {
    // First of all, we need a hotdog bun.
}

- (void) addWiener {
    // A nice piece of wiener is the main character here.
}

- (void) addKetchup {
    // Every hotdog needs ketchup.
}

- (void) addMustard {
    // I think mustard is also needed.
}

- (void) addOnion {
    // I think adding onion is a good idea.
}


@end
