//
//  FlowerFactory.m
//  Flyweight
//
//  Created by ShannonChen on 2017/11/20.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "FlowerFactory.h"



@interface FlowerFactory ()

@property (strong, nonatomic) NSMutableDictionary <NSNumber *, UIImageView *> *flowerPool;

@end

@implementation FlowerFactory

- (id)flowerViewWithType:(FlowerType)type {
    
    
    // 懒加载 _flowerPool
    if (_flowerPool == nil) {
        _flowerPool = [[NSMutableDictionary alloc]
                       initWithCapacity:kTotalNumberOfFlowerTypes];
    }
    
    // 从缓存池中获取 flower
    UIView *flowerView = _flowerPool[@(type)];
    
    // 如果池中没有对应类型的 flower，就新建一个 flower 对象，并加入到缓存池中
    if (flowerView == nil) {
        UIImage *flowerImage;
        
        switch (type) {
            case FlowerTypeAnemone:
                flowerImage = [UIImage imageNamed:@"anemone.png"];
                break;
            case FlowerTypeCosmos:
                flowerImage = [UIImage imageNamed:@"cosmos.png"];
                break;
            case FlowerTypeGerberas:
                flowerImage = [UIImage imageNamed:@"gerberas.png"];
                break;
            case FlowerTypeHollyhock:
                flowerImage = [UIImage imageNamed:@"hollyhock.png"];
                break;
            case FlowerTypeJasmine:
                flowerImage = [UIImage imageNamed:@"jasmine.png"];
                break;
            case FlowerTypeZinnia:
                flowerImage = [UIImage imageNamed:@"zinnia.png"];
                break;
            default:
                break;
        }
        
        flowerView = [[UIImageView alloc] initWithImage:flowerImage];
        _flowerPool[@(type)] = flowerView;
    }
    
    return flowerView;
}

@end
