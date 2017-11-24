//
//  DependencyInjectionTests.m
//  DependencyInjectionTests
//
//  Created by ShannonChen on 2017/11/24.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Example5.h"
#import <objc/runtime.h>

@interface DependencyInjectionTests : XCTestCase

@end

@implementation DependencyInjectionTests

- (void)testPublishedIsSet {
    NSDate *expectedPublishDate = [NSDate date];
    
    Article *article = [[Article alloc] init];
    
    [article publish];
    
    // I wish I knew how to test you...
    XCTAssertEqualObjects(expectedPublishDate, article.publishedAt, @"Published at should be at now");
}


- (void)testPublishedIsSetWithDateSwizzle {
    //Setup swizzle
    Method original,swizzled;
    original = class_getClassMethod([NSDate class], @selector(date));
    swizzled = class_getClassMethod([NSDate class], @selector(dateStub));
    method_exchangeImplementations(original, swizzled);
    
    // This now calls my dateStub
    NSDate *expectedPublishDate = [NSDate date];
    
    Article *article = [[Article alloc] init];
    [article publish];
    
    // I pass now
    XCTAssertEqualObjects(expectedPublishDate, article.publishedAt, @"Published should be equal to date");
}


@end
