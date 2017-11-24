//
//  ImageFilter.m
//  Decorator
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ImageFilter.h"

@interface ImageFilter ()


@end

@implementation ImageFilter

- (instancetype)initWithImageComponent:(id<ImageComponent>)component {
    if (self = [super init]) {
        _component = component;
    }
    
    return self;
}


- (void)apply {
    // 交给子类重写
}

// 拦截接收到的 draw 消息，当接收到的消息对应的方法找不到时，就会走这里
- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    NSString *selectorName = NSStringFromSelector(aSelector);
    if ([selectorName hasPrefix:@"draw"]) {
        // 执行自己的处理
        [self apply];
    }
    
    // 传递给下一个 component
    return self.component;
}

@end
