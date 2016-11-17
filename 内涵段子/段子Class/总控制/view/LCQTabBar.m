//
//  LCQTabBar.m
//  内涵段子
//
//  Created by Leonlincq on 16/11/14.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "LCQTabBar.h"
#import "LCQIssueViewController.h"

@implementation LCQTabBar

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        UIButton *customCenterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [customCenterButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [customCenterButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [customCenterButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:customCenterButton];
        
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        
    }
    return self;
}

-(void)clickButton:(UIButton *)button
{
    LCQIssueViewController *issueViewCtr = [[LCQIssueViewController alloc]init];
    
    UIViewController *rootView = [[[UIApplication sharedApplication]keyWindow]rootViewController];
    
    [rootView presentViewController:issueViewCtr animated:NO completion:^{
        
    }];
    
    
}




- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (int i = 0, j=0; i< self.subviews.count; i++)
    {
        if ([self.subviews[i] isKindOfClass:[UIButton class]])
        {
            self.subviews[i].frame = CGRectMake(0, 0, self.width/5, self.height);
            self.subviews[i].center = CGPointMake(self.width/2, self.height/2);
        }
        else if ([self.subviews[i] isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {

            self.subviews[i].frame = CGRectMake(self.width/5 * (j>1?j+1:j), 0, self.width/5, self.height);
            j++;
        }
    }
}









/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
