//
//  NSObject+ApiServiceProtocol.h
//  ProtocolProgrammingDemo
//
//  Created by haijiao on 15/12/20.
//  Copyright © 2015年 olinone. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 通过接口的定义，调用者可以不再关心ApiService对象，也无需了解其有哪些属性。即使需要重构替换新的对象，调用逻辑也不受任何影响。调用接口往往比访问对象属性更加稳定可靠
 */
@interface NSObject (ApiServiceProtocol)

- (void)requestGetNetWithUrl:(NSURL *)url Param:(NSDictionary *)param;
- (void)requestPostNetWithUrl:(NSURL *)url Param:(NSDictionary *)param;

@end
