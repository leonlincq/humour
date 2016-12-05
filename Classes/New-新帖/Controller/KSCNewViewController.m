//
//  KSCNewViewController.m
//  快上车
//
//  Created by Leonlincq on 15/7/22.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import "KSCNewViewController.h"

@implementation KSCNewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置导航栏标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    // 设置背景色
    self.view.backgroundColor = KSCGlobalBg;
}

- (void)tagClick
{
    KSCLogFunc;
}
@end
