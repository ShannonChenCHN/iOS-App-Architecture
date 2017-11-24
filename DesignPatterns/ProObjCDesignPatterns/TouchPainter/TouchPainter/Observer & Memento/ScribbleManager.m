//
//  ScribbleManager.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ScribbleManager.h"
#import "ScribbleThumbnailViewImageProxy.h"
#import "OpenScribbleCommand.h"

#define kScribbleDataPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data"]
#define kScribbleThumbnailPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/thumbnails"]

@interface ScribbleManager ()


@end


@implementation ScribbleManager

- (void)saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image {
    
    // 1. 文件名
    NSInteger newIndex = self.numberOfScribbles + 1;
    NSString *scribbleDataName = [NSString stringWithFormat:@"data_%@", @(newIndex)];
    NSString *scribbleThumbnailName = [NSString stringWithFormat:@"thumbnail_%@.png",
                                       @(newIndex)];
    
    // 2. 创建备忘录对象
    ScribbleMemento *scribbleMemento = [scribble scribbleMemento];
    NSData *mementoData = [scribbleMemento data];
    
    // 3. 保存涂鸦数据
    NSString *mementoPath = [[self scribbleDataPath] stringByAppendingPathComponent:scribbleDataName];
    [mementoData writeToFile:mementoPath atomically:YES];
    
    // 4. 保存缩略图
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    NSString *imagePath = [[self scribbleThumbnailPath] stringByAppendingPathComponent:scribbleThumbnailName];
    [imageData writeToFile:imagePath atomically:YES];
}

- (Scribble *)scribbleAtIndex:(NSInteger)index {
    
    Scribble *loadedScribble = nil;
    
    // 1. 获取路径
    NSArray *scribbleDataPathsArray = [self scribbleDataPaths];
    NSString *scribblePath = scribbleDataPathsArray.count > index ? scribbleDataPathsArray[index] : nil;
    
    // 2. 读取数据，从备忘录中解析数据
    if (scribblePath) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSData *scribbleData = [fileManager contentsAtPath:[kScribbleDataPath
                                                            stringByAppendingPathComponent:
                                                            scribblePath]];
        ScribbleMemento *scribbleMemento = [ScribbleMemento mementoWithData:scribbleData];
        loadedScribble = [Scribble scribbleWithMemento:scribbleMemento];
    }
    
    return loadedScribble;
}

- (UIView *)scribbleThumbnailViewAtIndex:(NSInteger)index {
    ScribbleThumbnailViewImageProxy *loadedScribbleThumbnail = nil;
    
    NSArray *scribbleThumbnailPathsArray = [self scribbleThumbnailPaths];
    NSArray *scribblePathsArray = [self scribbleDataPaths];
    
    NSString *scribbleThumbnailPath = [scribbleThumbnailPathsArray objectAtIndex:index];
    NSString *scribblePath = [scribblePathsArray objectAtIndex:index];
    
    if (scribbleThumbnailPath) {
        
        loadedScribbleThumbnail = [[ScribbleThumbnailViewImageProxy alloc] init];
        
        [loadedScribbleThumbnail setImagePath:[kScribbleThumbnailPath
                                               stringByAppendingPathComponent:
                                               scribbleThumbnailPath]];
        [loadedScribbleThumbnail setScribblePath:[kScribbleDataPath
                                                  stringByAppendingPathComponent:
                                                  scribblePath]];
        
        
        OpenScribbleCommand *touchCommand = [[OpenScribbleCommand alloc]
                                              initWithScribbleSource:loadedScribbleThumbnail];
        loadedScribbleThumbnail.touchCommand = touchCommand;
    }
    
    return loadedScribbleThumbnail;
}

- (NSInteger)numberOfScribbles {
    return [self scribbleDataPaths].count;
}

#pragma mark - Private Methods

- (NSString *)scribbleDataPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleDataPath]) {
        [fileManager createDirectoryAtPath:kScribbleDataPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:NULL];
    }
    
    return kScribbleDataPath;
}

- (NSString *)scribbleThumbnailPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleThumbnailPath]) {
        [fileManager createDirectoryAtPath:kScribbleThumbnailPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:NULL];
    }
    
    return kScribbleThumbnailPath;
}
- (NSArray *)scribbleDataPaths {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *scribbleDataPathsArray = [fileManager contentsOfDirectoryAtPath:[self scribbleDataPath]
                                                                       error:&error];
    
    return scribbleDataPathsArray;
}


- (NSArray *)scribbleThumbnailPaths {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *scribbleThumbnailPathsArray = [fileManager contentsOfDirectoryAtPath:[self scribbleThumbnailPath]
                                                                            error:&error];
    return scribbleThumbnailPathsArray;
}


@end
