//
//  Router.h
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^componentBlock) (id param);


/**
 路由机制
 */
@interface Router : NSObject

+ (instancetype)shareInstance;


- (void)registerURLPattern:(NSString *)urlPattern toHandler:(componentBlock)blk;
- (void)openURL:(NSString *)url withUserInfo:(id)param; // 给组件间调用的
- (BOOL)openURL:(NSString *)url; // 给 APP 间调用用的

@end
