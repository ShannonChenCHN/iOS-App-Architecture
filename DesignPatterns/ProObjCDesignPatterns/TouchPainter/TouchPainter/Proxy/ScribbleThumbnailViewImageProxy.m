//
//  ScribbleThumbnailViewImageProxy.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/19.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ScribbleThumbnailViewImageProxy.h"

@interface ScribbleThumbnailViewImageProxy ()

@property (nonatomic, strong) UIImage *realImage; // 用于保存加载后的真实图像引用
@property (nonatomic, assign) BOOL loadingThreadHasLaunched;

@end

@implementation ScribbleThumbnailViewImageProxy

@synthesize scribble = _scribble, scribblePath = _scribblePath;

- (Scribble *)scribble {
    if (_scribble == nil) {
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSData *scribbleData = [fileManager contentsAtPath:_scribblePath];
        
        ScribbleMemento *scribbleMemento = [ScribbleMemento mementoWithData:scribbleData];
        _scribble = [Scribble scribbleWithMemento:scribbleMemento];
    }
    
    return _scribble;
}

- (UIImage *)image {
    if (_realImage == nil) {
        _realImage = [UIImage imageWithContentsOfFile:self.imagePath];
    }
    return _realImage;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    // 没有加载好的图片数据，就绘制占位图
    if (self.realImage == nil) {
        // 开始绘制
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetLineWidth(context, 10.0);
        const CGFloat dashLengths[2] = {10,3};
        CGContextSetLineDash (context, 3, dashLengths, 2);
        CGContextSetStrokeColorWithColor(context, [[UIColor darkGrayColor] CGColor]);
        CGContextSetFillColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
        CGContextAddRect(context, rect);
        CGContextDrawPath(context, kCGPathFillStroke);
        
        // 如果还没有加载实际内容，就启动一个后台线程进行加载
        if (!self.loadingThreadHasLaunched) {
            [self performSelectorInBackground:@selector(forwardImageLoadingThread)
                                   withObject:nil];
            self.loadingThreadHasLaunched = YES;
        }
    }
    // 如果已经加载好了，就直接绘制
    else {
        [self.realImage drawInRect:rect];
    }
}


#pragma mark - A private method for loading a real image in a thread
- (void)forwardImageLoadingThread {
    @autoreleasepool {
        [self image];
        
        [self performSelectorInBackground:@selector(setNeedsDisplay) withObject:nil];
    }
}

#pragma mark - Touch event handlers
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.touchCommand execute];
}

@end
