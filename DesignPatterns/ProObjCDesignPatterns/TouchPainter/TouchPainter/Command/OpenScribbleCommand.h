//
//  OpenScribbleCommand.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Command.h"
#import "ScribbleSource.h"


/**
 加载涂鸦数据，打开花板的命令
 */
@interface OpenScribbleCommand : Command


@property (nonatomic, strong) id <ScribbleSource> scribbleSource;

- (instancetype)initWithScribbleSource:(id <ScribbleSource>)aScribbleSource;

@end
