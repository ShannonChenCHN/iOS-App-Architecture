//
//  ApiServicePassthrough.h
//  ProtocolProgrammingDemo
//
//  Created by haijiao on 15/12/20.
//  Copyright © 2015年 olinone. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ApiServiceProtocol <NSObject>

- (void)requestNetWithUrl:(NSURL *)url Param:(NSDictionary *)param;

@end

@protocol ApiService <ApiServiceProtocol>

// private functions

@end

@interface ApiServicePassthrough : NSObject

@property (nonatomic, strong) NSURL        *url;
@property (nonatomic, strong) NSDictionary *param;

/// 采用 POP 的思想，面向接口编程，而不是针对实现编程，避免具体对象的依赖
- (instancetype)initWithApiService:(id<ApiService>)apiService;
- (void)execNetRequest;

@end
