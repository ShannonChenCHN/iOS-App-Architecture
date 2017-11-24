//
//  ViewController.m
//  Flyweight
//
//  Created by ShannonChen on 2017/11/19.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ViewController.h"
#import "FlyweightView.h"
#import "FlowerFactory.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    FlowerFactory *factory = [[FlowerFactory alloc] init];
    NSMutableArray *flowerList = [[NSMutableArray alloc] initWithCapacity:500];
    
    for (int i = 0; i < 500; ++i) {

        // 从 享元工厂 中获取对应的 享元产品
        FlowerType flowerType = arc4random_uniform(kTotalNumberOfFlowerTypes) % kTotalNumberOfFlowerTypes;
        UIView *flowerView = [factory flowerViewWithType:flowerType];
        
        // 计算位置尺寸信息
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        CGFloat x = (arc4random() % (NSInteger)screenBounds.size.width);
        CGFloat y = (arc4random() % (NSInteger)screenBounds.size.height);
        NSInteger minSize = 10;
        NSInteger maxSize = 50;
        CGFloat size = (arc4random() % (maxSize - minSize + 1)) + minSize;
        
        
        // 封装信息
        ExtrinsicFlowerState *extrinsicState = [[ExtrinsicFlowerState alloc] init];
        extrinsicState.flowerView = flowerView;
        extrinsicState.area = CGRectMake(x, y, size, size);
        
        [flowerList addObject:extrinsicState];
    }
    
    [(FlyweightView *)self.view setFlowerList:flowerList];
}

- (void)loadView {
    self.view = [[FlyweightView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}


@end
