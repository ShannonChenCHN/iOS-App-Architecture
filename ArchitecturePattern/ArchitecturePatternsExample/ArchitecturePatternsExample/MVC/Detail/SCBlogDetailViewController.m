//
//  SCBlogDetailViewController.m
//  ArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/9/21.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCBlogDetailViewController.h"
#import "SCBlog.h"

@interface SCBlogDetailViewController ()

@property (strong, nonatomic) SCBlog *blog;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation SCBlogDetailViewController

- (instancetype)initWithBlog:(SCBlog *)blog {
    if (self = [super init]) {
        _blog = blog;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.blog.blogTitle;
    self.titleLabel.text = self.blog.blogTitle;
}

@end
