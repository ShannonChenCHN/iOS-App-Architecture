//
//  SCUserAPIManger.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/14.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
#import "SCUserAPI.h"

/**
 用户信息 API
 */
@interface SCUserAPIManger : YTKRequest <SCUserAPI>



@end
