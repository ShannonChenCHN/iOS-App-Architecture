//
//  Vertex.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/28.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"


/// 顶点，为绘图提供位置信息
@interface Vertex : NSObject <Mark>


@property (nonatomic, assign) CGPoint location;
@property (nonatomic, assign, readonly) NSUInteger count;


- (instancetype)initWithLocation:(CGPoint)location;

@end
