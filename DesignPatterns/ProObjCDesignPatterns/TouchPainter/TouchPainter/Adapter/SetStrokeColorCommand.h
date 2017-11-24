//
//  SetStrokeColorCommand.h
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/30.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "Command.h"
#import "SetStrokeColorCommandDelegate.h"

@interface SetStrokeColorCommand : Command

@property (nonatomic, weak) id <SetStrokeColorCommandDelegate> delegate;

@end
