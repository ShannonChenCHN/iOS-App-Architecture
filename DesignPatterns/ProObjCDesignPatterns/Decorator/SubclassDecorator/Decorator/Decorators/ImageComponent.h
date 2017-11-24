//
//  ImageComponent.h
//  Decorator
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 用 UIImage 的 draw-xxx 系类方法声明一个抽象接口，任何具体的 ImageComponent 和装饰器都可以处理这些调用。
 装饰器的 draw-xxx 方法会拦截自己接收到的 draw-xxx 消息，并进行自己的“装饰”行为，然后再将消息转发给下一个装饰器或者具体的 ImageComponent。
 作为末端的 UIImage 的 draw-xxx 方法会把自己的内容绘制到当前图形上下文中。
 */
@protocol ImageComponent <NSObject>

@optional

- (void)drawAtPoint:(CGPoint)point;
- (void)drawAtPoint:(CGPoint)point blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;

- (void)drawInRect:(CGRect)rect;
- (void)drawInRect:(CGRect)rect blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;

- (void)drawAsPatternInRect:(CGRect)rect;

@end
