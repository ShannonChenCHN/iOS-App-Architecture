//
//  SCUserInfoViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/11.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCUserInfoViewController.h"
#import "SCUserAPIManger.h"

#import "SCUser.h"


@interface SCUserInfoViewController ()

@property (strong, nonatomic) SCUser *user;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation SCUserInfoViewController

@synthesize eventHandler = _eventHandler;

    
- (instancetype)initWithUserId:(NSString *)userId {
    self = [super init];
    if (self) {
        _userId = userId;
    }
    
    return self;
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor grayColor];
}
    
- (void)fetchDataWithCompletionHandler:(void (^)(NSError *, id))completion {
    
    SCUserAPIManger *api = [[SCUserAPIManger alloc] initWithUserId:self.userId];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        
        
    } failure:^(YTKBaseRequest *request) {
        // you can use self here, retain cycle won't happen
        
        self.user = [[SCUser alloc] initWithUserId:self.userId];
        self.nameLabel.text = self.user.name;
    }];
    
}


- (IBAction)didSelectUserAvatar:(id)sender {
    
    if (self.eventHandler) {
        self.eventHandler(NSStringFromSelector(@selector(didSelectUserAvatar:)), self.user);
    }
}


@end
