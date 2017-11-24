//
//  CustomTextField.h
//  Strategy
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputValidator.h"

@interface CustomTextField : UITextField

@property (strong, nonatomic) InputValidator *inputValidator;


- (BOOL)validate;

@end
