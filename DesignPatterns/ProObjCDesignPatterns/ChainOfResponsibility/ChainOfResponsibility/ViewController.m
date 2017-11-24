//
//  ViewController.m
//  ChainOfResponsibility
//
//  Created by ShannonChen on 2017/11/18.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ViewController.h"
#import "SwordAttack.h"
#import "MagicFireAttack.h"
#import "LightningAttack.h"
#import "MetalArmor.h"
#import "CrystalShield.h"
#import "Avatar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     Cocoa 中的 Responder Chain 就是一个典型的责任链模式
     */
    
    // create a new avatar
    AttackHandler *avatar = [[Avatar alloc] init];
    
    // put it in metal armor
    AttackHandler *metalArmoredAvatar = [[MetalArmor alloc] init];
    metalArmoredAvatar.nextAttackHandler = avatar;
    
    // then add a crytal shield
    // to the avatar who's in
    // a metal armor
    AttackHandler *superAvatar = [[CrystalShield alloc] init];
    superAvatar.nextAttackHandler = metalArmoredAvatar;
    
    // ... some other actions
    
    
    
    // attack the avatar with
    // a sword
    Attack *swordAttack = [[SwordAttack alloc] init];
    [superAvatar handleAttack:swordAttack];
    
    // then attack the avatar with
    // magic fire
    Attack *magicFireAttack = [[MagicFireAttack alloc] init];
    [superAvatar handleAttack:magicFireAttack];
    
    // now there is a new attack
    // with lightning...
    Attack *lightningAttack = [[LightningAttack alloc] init];
    [superAvatar handleAttack:lightningAttack];
    
    // ... further actions
}

@end
