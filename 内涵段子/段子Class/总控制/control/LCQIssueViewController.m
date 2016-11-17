//
//  LCQIssueViewController.m
//  内涵段子
//
//  Created by Leonlincq on 16/11/17.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "LCQIssueViewController.h"
#import "LCQButton.h"

@interface LCQIssueViewController ()

@property (nonatomic,strong) UIImageView *topImageView;

@end

@implementation LCQIssueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _topImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"app_slogan"]];
    

    _topImageView.centerX = SCREEN_WIDTH*0.5;
    _topImageView.centerY = SCREEN_HEIGHT*0.2;
    
    [self.view addSubview:_topImageView];
    
    
    NSArray *imageNameArray = @[@"publish-video",@"publish-picture",@"publish-text",@"publish-audio",@"publish-review",@"publish-offline"];
    
    NSArray *functionNameArray = @[@"发视频",@"发图片",@"发段子",@"发声音",@"审帖",@"离线下载"];
    
    NSInteger oneLineNum = 3;
    NSInteger horizonBeginSpace = 20;
    NSInteger verticaSpace = 10;
    NSInteger buttonWidth = 72;
    NSInteger buttonHeith = buttonWidth + 28;
    
    NSInteger horizonCenterSpace = (SCREEN_WIDTH - 2*horizonBeginSpace - 3*buttonWidth)/(oneLineNum-1);
    NSInteger verticaBeginSpace = (SCREEN_HEIGHT - 2*buttonHeith - verticaSpace)/2;
    
    
    for (int i = 0; i<imageNameArray.count; i++)
    {
        LCQButton *button = [[LCQButton alloc]init];
        button.backgroundColor = [UIColor clearColor];
        [button setImage:[UIImage imageNamed:imageNameArray[i]] forState:UIControlStateNormal];
        [button setTitle:functionNameArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        
        NSInteger line = i/oneLineNum;
        NSInteger row = i%oneLineNum;
        
        NSInteger buttonX = horizonBeginSpace + row * (buttonWidth + horizonCenterSpace);
        NSInteger buttonY = verticaBeginSpace + line* (buttonHeith +  + verticaSpace);
        
        button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeith);

        [self.view addSubview:button];
        
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
//    POPSpringAnimation *myPopAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//    
//    myPopAnimation.fromValue = @(200);
//    myPopAnimation.toValue = @(500);
//    
//    myPopAnimation.springSpeed = 20;
//    myPopAnimation.springBounciness = 30;
//    
//    [self.topImageView.layer pop_addAnimation:myPopAnimation forKey:@"TestKey"];
    
    POPSpringAnimation *myPopAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    
    myPopAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    myPopAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    
    myPopAnimation.springSpeed = 20;
    myPopAnimation.springBounciness = 30;
    
    [self.topImageView pop_addAnimation:myPopAnimation forKey:@"TestKey"];
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)canceButtonClick:(id)sender
{
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
    
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
