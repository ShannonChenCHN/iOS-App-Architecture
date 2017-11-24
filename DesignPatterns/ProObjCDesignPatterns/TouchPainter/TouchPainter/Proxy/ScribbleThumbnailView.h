//
//  ScribbleThumbnailView.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/19.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"
#import "ScribbleSource.h"

@interface ScribbleThumbnailView : UIView <ScribbleSource>

@property (strong, nonatomic, readonly) Scribble *scribble;
@property (nonatomic, strong, readonly) UIImage *image;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *scribblePath;

@end
