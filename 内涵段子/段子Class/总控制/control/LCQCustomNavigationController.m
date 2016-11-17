//
//  LCQCustomNavigationController.m
//  内涵段子
//
//  Created by Leonlincq on 16/11/15.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "LCQCustomNavigationController.h"

@interface LCQCustomNavigationController ()

@end

@implementation LCQCustomNavigationController

+ (void)initialize
{
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    if (self.childViewControllers.count > 0)
    {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
        backButton.size = CGSizeMake(70, 40);
        
        backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        
        [backButton addTarget:self action:@selector(theBackBarButton:) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
        
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.view.backgroundColor = ALLVIEWBGCOLOR;
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 导航栏左边按钮事件
- (void)theBackBarButton:(UIButton *)backButton
{
    [self popViewControllerAnimated:YES];
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
