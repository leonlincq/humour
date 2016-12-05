//
//  KSCFriendTrendsViewController.m
//  快上车
//
//  Created by Leonlincq on 15/7/22.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import "KSCFriendTrendsViewController.h"
#import "KSCRecommendViewController.h"
#import "KSCLoginRegisterViewController.h"

@interface KSCFriendTrendsViewController()

@end

@implementation KSCFriendTrendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置导航栏标题
    self.navigationItem.title = @"我的关注";
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
    
    // 设置背景色
    self.view.backgroundColor = KSCGlobalBg;
}

- (void)friendsClick
{
    KSCRecommendViewController *vc = [[KSCRecommendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)loginRegister {
    KSCLoginRegisterViewController *login = [[KSCLoginRegisterViewController alloc] init];
    [self presentViewController:login animated:YES completion:nil];
}
@end
