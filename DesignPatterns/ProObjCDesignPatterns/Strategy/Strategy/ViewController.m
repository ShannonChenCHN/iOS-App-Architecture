//
//  ViewController.m
//  Strategy
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ViewController.h"
#import "CustomTextField.h"
#import "NumericInputValidator.h"
#import "AlphaInputValidator.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet CustomTextField *numericTextField;
@property (weak, nonatomic) IBOutlet CustomTextField *alphaTextField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 策略模式：将各种具体类型的算法分离成可以相互替换的多个类，使用者可以根据自己的需要设置对应的 strategy 实例
    // 应用场景：替代大体量的 if-else 分支
    self.numericTextField.inputValidator = [[NumericInputValidator alloc] init];
    self.alphaTextField.inputValidator = [[AlphaInputValidator alloc] init];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(CustomTextField *)textField {
    
    // 使用传统方式
    //if (textField == numericTextField)
    //{
    // validate [textField text] and make sure
    // the value is numeric
    //}
    //else if (textField == alphaTextField)
    //{
    // validate [textField text] and make sure
    // the value contains only letters
    //}
    
    // 使用策略模式
    if ([textField isKindOfClass:[CustomTextField class]]) {
        [textField validate];
    }
}

@end
