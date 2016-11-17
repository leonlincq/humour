//
//  LCQMeViewController.m
//  内涵段子
//
//  Created by Leonlincq on 16/11/11.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "LCQMeViewController.h"

@interface LCQMeViewController ()

@end

@implementation LCQMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"我的";
    
    UIBarButtonItem *item1 = [UIBarButtonItem itemWithImageName:@"mine-moon-icon" andHightImageName:@"mine-moon-icon-click" addTarget:self action:@selector(theMeRightMoonBarButton:)];

    UIBarButtonItem *item2 = [UIBarButtonItem itemWithImageName:@"mine-setting-icon" andHightImageName:@"mine-setting-icon-click" addTarget:self action:@selector(theMeRightSettingBarButton:)];
    
    self.navigationItem.rightBarButtonItems = @[item2,item1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 导航栏右边按钮时间
- (void)theMeRightMoonBarButton:(UIButton *)leftButton
{
    NSLOGFUNC;
}

- (void)theMeRightSettingBarButton:(UIButton *)leftButton
{
    NSLOGFUNC;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
