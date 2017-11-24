//
//  NSObject+ApiServiceProtocol.m
//  ProtocolProgrammingDemo
//
//  Created by haijiao on 15/12/20.
//  Copyright © 2015年 olinone. All rights reserved.
//

#import "NSObject+ApiServiceProtocol.h"
#import "ApiServicePassthrough.h"
#import "GetApiService.h"
#import "PostApiService.h"
#import "JSObjection.h"

@implementation NSObject (ApiServiceProtocol)

- (void)requestGetNetWithUrl:(NSURL *)url Param:(NSDictionary *)param {
    // 采用 POP 的思想，面向接口编程，而不是针对实现编程，避免具体对象的依赖
    id<ApiService> apiSrevice = [[JSObjection createInjector] getObject:[GetApiService class]];
    
    // 使用装饰器模式来从外部修改对象
    ApiServicePassthrough *apiServicePassthrough = [[ApiServicePassthrough alloc] initWithApiService:apiSrevice];
    apiServicePassthrough.url = url;
    apiServicePassthrough.param = param;
    [apiServicePassthrough execNetRequest];
}

- (void)requestPostNetWithUrl:(NSURL *)url Param:(NSDictionary *)param {
    id<ApiService> apiSrevice = [[JSObjection createInjector] getObject:[PostApiService class]];
    ApiServicePassthrough *apiServicePassthrough = [[ApiServicePassthrough alloc] initWithApiService:apiSrevice];
    apiServicePassthrough.url = url;
    apiServicePassthrough.param = param;
    [apiServicePassthrough execNetRequest];
}

@end
