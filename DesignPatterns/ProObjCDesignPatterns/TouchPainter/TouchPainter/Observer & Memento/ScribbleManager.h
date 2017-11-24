//
//  ScribbleManager.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scribble.h"
#import "ScribbleMemento.h"

@interface ScribbleManager : NSObject

@property (assign, nonatomic, readonly) NSInteger numberOfScribbles;

- (void)saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image;
- (Scribble *)scribbleAtIndex:(NSInteger)index;
- (UIView *)scribbleThumbnailViewAtIndex:(NSInteger)index;

@end
