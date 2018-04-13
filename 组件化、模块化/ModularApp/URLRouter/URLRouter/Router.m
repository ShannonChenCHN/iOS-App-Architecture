//
//  Router.m
//  ModularApp
//
//  Created by ShannonChen on 2018/4/12.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "Router.h"

// 这里对各组件产生了依赖，类越来越多，文件越来越大，所以也可以像 casa 的方案那样采用 runtime 的方式来优化，
// 但是这样的话就会产生更多的 hardcode。减少依赖的另一个好处在于组件化开发时，在开发一个组件不会因为 Mediator
// 而间接依赖了另一个组件。但是对于不需要组件化的项目开发，可以不用 runtime 取  hardcode，因为这样反而会增加成本，容易出错。
#import "YHModuleUser.h"
#import "YHModuleCommunity.h"
#import "YHModuleReservation.h"

@interface Router ()

@property (nonatomic, strong) NSMutableDictionary *cache;

@end

@implementation Router

+ (void)load {
    
    [[Router shareInstance] registerURLPattern:@"yhouse://eventDeatil" toHandler:^(NSDictionary *param) {
        UIViewController *vc = [YHModuleCommunity eventDetailViewControllerWithId:param[@"eventId"]];
        [(UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController pushViewController:vc animated:YES];
    }];
    
    [[Router shareInstance] registerURLPattern:@"yhouse://restaurant" toHandler:^(NSDictionary *param) {
        UIViewController *vc = [YHModuleReservation restaurantViewControllerWithId:param[@"restaurantId"]];
        [(UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController pushViewController:vc animated:YES];
    }];
    
    [[Router shareInstance] registerURLPattern:@"yhouse://user" toHandler:^(NSDictionary *param) {
        UIViewController *vc = [YHModuleUser userViewControllerWithId:param[@"userId"]];
        [(UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController pushViewController:vc animated:YES];
    }];
    
    [[Router shareInstance] registerURLPattern:@"yhouse://login" toHandler:^(NSDictionary *param) {
        UIViewController *vc = [YHModuleUser loginControllerWithCompletionHandler:param[@"completionHandler"]];
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
        [(UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navi animated:YES completion:NULL];
    }];
}

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

- (void)openURL:(NSString *)url withUserInfo:(id)param {
    componentBlock blk = [_cache objectForKey:url];
    if (blk) blk(param);
}

- (BOOL)openURL:(NSString *)url {
    componentBlock blk = [_cache objectForKey:url];
    if (blk) {
        // 解析 url
        // ...
        blk(nil/* 参数 */);
        return YES;
    } else {
        return NO;
    }
}

@end
