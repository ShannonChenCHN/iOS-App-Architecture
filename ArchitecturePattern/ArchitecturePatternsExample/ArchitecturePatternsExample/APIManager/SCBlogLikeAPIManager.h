//
//  SCBlogLikeAPIManager.h
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/6.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>


/**
 博客点赞 API
 */
@interface SCBlogLikeAPIManager : YTKRequest

- (instancetype)initWithBlogId:(NSString *)blogId;
    
@end
