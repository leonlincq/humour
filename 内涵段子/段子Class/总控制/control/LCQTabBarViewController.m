//
//  LCQTabBarViewController.m
//  内涵段子
//
//  Created by Leonlincq on 16/11/11.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "LCQTabBarViewController.h"

#import "LCQTabBar.h"

#import "LCQEssenceViewController.h"
#import "LCQNewViewController.h"
#import "LCQAttentionViewController.h"
#import "LCQMeViewController.h"
#import "LCQCustomNavigationController.h"

@interface LCQTabBarViewController ()

@end

@implementation LCQTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0],NSForegroundColorAttributeName:[UIColor lightGrayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0],NSForegroundColorAttributeName:[UIColor darkGrayColor]} forState:UIControlStateSelected];
    

    [self setChildView:[[LCQEssenceViewController alloc]init] andTitle:@"精华" andImageName:@"tabBar_essence_icon" andSelectImageName:@"tabBar_essence_click_icon"];
    
    [self setChildView:[[LCQNewViewController alloc]init] andTitle:@"新帖" andImageName:@"tabBar_new_icon" andSelectImageName:@"tabBar_new_click_icon"];
    
    [self setChildView:[[LCQAttentionViewController alloc]init] andTitle:@"关注" andImageName:@"tabBar_friendTrends_icon" andSelectImageName:@"tabBar_friendTrends_click_icon"];
    
    [self setChildView:[[LCQMeViewController alloc]init] andTitle:@"我" andImageName:@"tabBar_me_icon" andSelectImageName:@"tabBar_me_click_icon"];
    
    
    [self setValue:[[LCQTabBar alloc]init] forKeyPath:@"tabBar"];

}

-(void)setChildView:(UIViewController *)viewControl andTitle:(NSString *)titleName andImageName:(NSString *)imagename andSelectImageName:(NSString *)selectImageName
{
    viewControl.tabBarItem.title = titleName;
    viewControl.tabBarItem.image = [UIImage imageNamed:imagename];
    viewControl.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    
    viewControl.view.backgroundColor = ALLVIEWBGCOLOR;
    
    [self addChildViewController:[[LCQCustomNavigationController alloc] initWithRootViewController:viewControl]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
