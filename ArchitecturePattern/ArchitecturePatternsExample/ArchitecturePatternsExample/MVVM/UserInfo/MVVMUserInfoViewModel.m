//
//  MVVMUserInfoViewModel.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/8.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "MVVMUserInfoViewModel.h"

#import "SCUserAPIManger.h"

@interface MVVMUserInfoViewModel ()

@property (copy, nonatomic) NSString *userId;

@property (strong, nonatomic) RACSignal *userInfoFetchingSignal;

@end

@implementation MVVMUserInfoViewModel

- (instancetype)initWithUserId:(NSString *)userId {
    if (self = [super init]) {
        
        _userId = userId;
        
    }
    
    return self;
}

- (RACSignal *)userInfoFetchingSignal {

    if (!_userInfoFetchingSignal) {
    
        @weakify(self);
        _userInfoFetchingSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            @strongify(self);
            
            // 发起请求
            SCUserAPIManger *api = [[SCUserAPIManger alloc] initWithUserId:self.userId];
            [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                
                
                [subscriber sendNext:request.responseObject];
                [subscriber sendCompleted];
                
            } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                
                
//                [subscriber sendError:request.error];

#warning 理论上要执行 sendError 的，这里只是模拟成功的情况
                [subscriber sendNext:request.responseObject];
                [subscriber sendCompleted];
            }];
            
            return nil;
        }];
    }
    return _userInfoFetchingSignal;
}

- (RACCommand *)userInfoFetchingCommand {

    if (!_userInfoFetchingCommand) {
    
        @weakify(self);
        _userInfoFetchingCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            
            RACSignal *signal = [self.userInfoFetchingSignal doNext:^(id x) {
                
                // 转换数据
                self.user = [[SCUser alloc] initWithUserId:self.userId];
                self.username = self.user.name;
                self.avatarURLString = self.user.avartarURLString;
                
            }];
            
            return signal;
        }];
    }
    
    return _userInfoFetchingCommand;
}

@end
