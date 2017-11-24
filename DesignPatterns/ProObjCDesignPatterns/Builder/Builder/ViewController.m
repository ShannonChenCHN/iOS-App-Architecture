//
//  ViewController.m
//  Builder
//
//  Created by ShannonChen on 2017/10/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ViewController.h"
#import "ChasingGame.h"
#import <WebKit/WebKit.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     builder 模式其实在 Cocoa Touch 中就出现过，比如用 WKWebViewConfiguration 来初始化 WKWebView
     不知道这个算不算？
    */
    
    CharacterBuilder *builder = [[CharacterBuilder alloc] init];
    ChasingGame *game = [[ChasingGame alloc] init];
    
    Character *player = [game createPlayerWithBuilder:builder];
    Character *enemy = [game createEnemyWithBuilder:builder];
}




@end
