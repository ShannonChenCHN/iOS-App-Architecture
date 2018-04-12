//
//  Router.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "Router.h"

@interface Router ()

@property (nonatomic, strong) NSMutableDictionary *cache;

@end

@implementation Router

+ (instancetype)shareInstance {
    
    static Router *router;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[self alloc] init];
    });
    
    return router;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _cache = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)registerURLPattern:(NSString *)urlPattern toHandler:(componentBlock)blk {
    [_cache setObject:blk forKey:urlPattern];
}

- (void)openURL:(NSString *)url withParam:(id)param {
    componentBlock blk = [_cache objectForKey:url];
    if (blk) blk(param);
}

@end
