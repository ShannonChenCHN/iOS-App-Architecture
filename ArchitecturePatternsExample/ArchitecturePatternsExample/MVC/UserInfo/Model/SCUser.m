//
//  SCUser.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCUser.h"

#define kCurrentUserAvatarURL       @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1175623322,348616722&fm=85&s=FDA18953AE717794318984DA0300D031"
#define kOtherUserAvatarURL         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1266401470,2163336146&fm=58&bpow=690&bpoh=955"

@implementation SCUser

- (instancetype)initWithUserId:(NSString *)userId {
    
    if (self = [super init]) {
        self.name = [userId isEqualToString:kCurrentUserId] ? @"赵丽颖" : @"刘诗诗";
        self.avartarURLString = [userId isEqualToString:kCurrentUserId] ?
                                kCurrentUserAvatarURL :
                                kOtherUserAvatarURL;
        self.userId = userId;
        self.summary = [NSString stringWithFormat:@"userSummary%@", userId];
        self.blogCount = 23;
        self.friendCount = 34;
    }
    
    return self;
}

@end
