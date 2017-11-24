//
//  Sandwich.h
//  TemplateMethod
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sandwich : NSObject

- (void)make;

// 模板方法(钩子方法)：制作三明治的步骤
- (void)prepareBread;
- (void)putBreadOnPlate;
- (void)addMeat;
- (void)addCondiments;
- (void)extraStep; // 额外步骤
- (void)serve;

@end
