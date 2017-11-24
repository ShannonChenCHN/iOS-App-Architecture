//
//  ViewController.m
//  Decorator
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ViewController.h"

#import "ImageTransformFilter.h"
#import "ImageShadowFilter.h"
#import "DecoratorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 加载原始图像
    UIImage *image = [UIImage imageNamed:@"Image"];
    
    // 创建变换
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(-M_PI / 4.0);
    CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(-image.size.width / 2.0, image.size.height / 8.0);
    
    CGAffineTransform finalTransform = CGAffineTransformConcat(rotateTransform, translateTransform);
    
    id <ImageComponent> transformedImage = [[ImageTransformFilter alloc] initWithImageComponent:image transform:finalTransform];
    id <ImageComponent> finalImage = [[ImageShadowFilter alloc] initWithImageComponent:transformedImage];
    
    // 用滤镜处理过的图像创建新的 DecoratorView
    DecoratorView *decoratorView = [[DecoratorView alloc] initWithFrame:self.view.bounds];
    decoratorView.image = finalImage;
    [self.view addSubview:decoratorView];
}


@end
