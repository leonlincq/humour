//
//  KSCLoginRegisterViewController.m
//  快上车
//
//  Created by Leonlincq on 15/7/26.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import "KSCLoginRegisterViewController.h"

@interface KSCLoginRegisterViewController ()
/** 登录框距离控制器view左边的间距 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewLeftMargin;
@end

@implementation KSCLoginRegisterViewController

- (IBAction)back {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (IBAction)showLoginOrRegister:(UIButton *)button {
    // 退出键盘
    [self.view endEditing:YES];
    
    if (self.loginViewLeftMargin.constant == 0) { // 显示注册界面
        self.loginViewLeftMargin.constant = - self.view.width;
        button.selected = YES;
    } else { // 显示登录界面
        self.loginViewLeftMargin.constant = 0;
        button.selected = NO;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}
@end
