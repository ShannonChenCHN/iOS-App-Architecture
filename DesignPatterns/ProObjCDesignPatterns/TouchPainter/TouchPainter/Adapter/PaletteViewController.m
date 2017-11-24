//
//  PaletteViewController.m
//  TouchPainter
//
//  Created by ShannonChen on 2017/10/30.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "PaletteViewController.h"
#import "SetStrokeColorCommandDelegate.h"
#import "CommandSlider.h"

@interface PaletteViewController () <SetStrokeColorCommandDelegate>

@property (weak, nonatomic) IBOutlet CommandSlider *redSlider;
@property (weak, nonatomic) IBOutlet CommandSlider *greenSlider;
@property (weak, nonatomic) IBOutlet CommandSlider *blueSlider;

@property (weak, nonatomic) IBOutlet UIView *paletteView;

@property (weak, nonatomic) IBOutlet CommandSlider *strokeSlider;

@end

@implementation PaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.navigationItem.title = @"Palette";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
    
    [self updateColor];
}

- (void)updateColor {

    self.paletteView.backgroundColor = self.strokeColor;

    self.strokeSlider.tintColor = self.strokeColor;
    self.strokeSlider.minimumTrackTintColor = self.strokeColor;
    
    CGFloat redValue = 0.0;
    CGFloat greenValue = 0.0;
    CGFloat blueValue = 0.0;
    [self.strokeColor getRed:&redValue green:&greenValue blue:&blueValue alpha:NULL];
    
    self.redSlider.value = redValue;
    self.greenSlider.value = greenValue;
    self.blueSlider.value = blueValue;
    
    self.strokeSlider.command.delegate = self;
    
    
    /*
     适配器模式：
     用于连接两种不同种类的对象，使其无缝对接地协同工作。
     
     在这个例子中，
     SetStrokeColorCommand 对象就相当于客户端（Client），它不在乎谁提供这些值，这些值应该从任何遵循 <SetStrokeColorCommandDelegate> 协议
     的适配器中来获取。
     SetStrokeColorCommandDelegate 协议就是目标接口（Target）
     PaletteViewController 对象就是实现协议（也就是统一接口）的适配器（Adapter）
     PaletteViewController 在实现协议时，会在其内部调用真正的实现，也就是被适配者(Adaptee) CommandSlider 的实现
     被适配者是可以被替换的，其他可以不变，比如说，我们以后把颜色变更的部分由滑块改成色轮，我们只需要把被适配者的逻辑替换一下，其他逻辑仍然可以复用
     
     输入  --> 逻辑处理  --> 输出
      V       command       V
            (Controller)
     
     */
    SetStrokeColorCommand *command = [[SetStrokeColorCommand alloc] init];
    command.delegate = self;
    self.redSlider.command = command;
    self.greenSlider.command = command;
    self.blueSlider.command = command;
    
    
}
    
- (void)done {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onCommandSliderValueChanged:(CommandSlider *)slider {
    [slider.command execute];  // 把调色板上颜色改变的事件通知另一方
}

#pragma mark - <SetStrokeColorCommandDelegate>
// 另一方获取变化数据的回调
- (void)command:(SetStrokeColorCommand *)command didRequestColorComponentsForRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue {
    *red = self.redSlider.value;
    *green = self.greenSlider.value;
    *blue = self.blueSlider.value;
}

// 另一方处理完后的回调，获取另一方对颜色变化的处理结果
- (void)command:(SetStrokeColorCommand *)command didFinishColorUpdateWithColor:(UIColor *)color {
    self.paletteView.backgroundColor = color;
}

@end
