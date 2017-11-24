//
//  CabDriver.m
//  Facade
//
//  Created by Carlo Chung on 11/15/10.
//  Copyright 2010 Carlo Chung. All rights reserved.
//

#import "CabDriver.h"


@implementation CabDriver

- (void) driveToLocation:(CGPoint)x withCompletion:(void (^)(float))completion {
  
    // 启动计价器
    Taximeter *meter = [[Taximeter alloc] init];
    [meter start];

    // 启动汽车
    Car *car = [[Car alloc] init];
    [car releaseBrakes];
    [car changeGears];
    [car pressAccelerator];
  
    CGPoint currentLocation = CGPointZero;
    while (!CGPointEqualToPoint(currentLocation, x)) {
    currentLocation = CGPointMake(currentLocation.x + 10, currentLocation.y + 10);
    }

    // 到达目的地点后停车、停止计价
    [car releaseAccelerator];
    [car pressBrakes];
    [meter stop];
    
    if (completion) {
        completion(meter.price);
    }
}

@end
