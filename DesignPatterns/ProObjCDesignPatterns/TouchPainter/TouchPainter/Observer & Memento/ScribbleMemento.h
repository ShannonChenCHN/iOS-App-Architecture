//
//  ScribbleMemento.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 保存涂鸦的备忘录
 
 这个头文件提供了窄（公有）接口给 ScribbleManager
 
 为什么需要这个备忘录？而不是直接用 NSData？
 1. 备忘录数据本身能够容纳有关 scribble 对象内部状态的各种信息，所以我们可以决定是保存全部内容，还是修改过的内容，我们可以通过备忘录来实现如何保存以及如何恢复
 2. 内存中的 ScribbleMemento 对象可以重用于应用程序中的不同地方
 */
@interface ScribbleMemento : NSObject

/// 通过保存的二进制数据读取备忘录状态
+ (ScribbleMemento *)mementoWithData:(NSData *)data;

/// 保存的二进制数据
- (NSData *)data;

@end
