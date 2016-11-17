//
//  LCQNewViewController.m
//  内涵段子
//
//  Created by Leonlincq on 16/11/11.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "LCQNewViewController.h"

@interface LCQNewViewController ()

@end

@implementation LCQNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"MainTagSubIcon" andHightImageName:@"MainTagSubIconClick" addTarget:self action:@selector(theNewLeftBarButton:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 导航栏左边按钮时间
- (void)theNewLeftBarButton:(UIButton *)leftButton
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
