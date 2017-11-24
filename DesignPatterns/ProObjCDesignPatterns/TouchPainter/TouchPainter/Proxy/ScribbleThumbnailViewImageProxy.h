//
//  ScribbleThumbnailViewImageProxy.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/19.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ScribbleThumbnailView.h"
#import "Command.h"


@interface ScribbleThumbnailViewImageProxy : ScribbleThumbnailView 

@property (nonatomic, strong) Command *touchCommand;


@end
