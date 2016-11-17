//
//  LCQIssueViewController.m
//  内涵段子
//
//  Created by Leonlincq on 16/11/17.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "LCQIssueViewController.h"
#import "LCQButton.h"

typedef void(^animationFished)();


@interface LCQIssueViewController ()

@end

@implementation LCQIssueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.view.userInteractionEnabled = NO;
    
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

        NSInteger buttonToY = verticaBeginSpace + line* (buttonHeith +  + verticaSpace);
        NSInteger buttonFromY = buttonToY - SCREEN_HEIGHT;
        
        button.frame = CGRectMake(buttonX, buttonFromY, buttonWidth, buttonHeith);

        [button addTarget:self action:@selector(issueButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        button.tag = 1000+i;
        
        [self.view addSubview:button];
        
        POPSpringAnimation *buttonSpringAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        
        buttonSpringAnimation.fromValue = [NSValue valueWithCGRect:CGRectMake(buttonX,buttonFromY , buttonWidth, buttonHeith)];
        buttonSpringAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonToY, buttonWidth, buttonHeith)];
        
        buttonSpringAnimation.springSpeed = 10;
        buttonSpringAnimation.springBounciness = 10;
        
        buttonSpringAnimation.beginTime = CACurrentMediaTime()+(imageNameArray.count - i)*0.1;
        
        [button pop_addAnimation:buttonSpringAnimation forKey:[NSString stringWithFormat:@"buttonSpring%d",i]];
    }
    
    
    UIImageView *topImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"app_slogan"]];
    
    topImageView.tag = 1000 + imageNameArray.count;
    
    topImageView.centerX = SCREEN_WIDTH*0.5;
    topImageView.centerY = SCREEN_HEIGHT*0.2 - SCREEN_HEIGHT;
    
    [self.view addSubview:topImageView];
    
    POPSpringAnimation *topImageViewSpringAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    
    topImageViewSpringAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(topImageView.centerX, topImageView.centerY)];
    topImageViewSpringAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*0.5, SCREEN_HEIGHT*0.2)];;
    
    topImageViewSpringAnimation.springSpeed = 10;
    topImageViewSpringAnimation.springBounciness = 10;
    
    topImageViewSpringAnimation.beginTime = CACurrentMediaTime()+imageNameArray.count *0.1;
    

    [topImageViewSpringAnimation setCompletionBlock:^(POPAnimation *pop, BOOL fineshed){
            if (fineshed)
            {
                self.view.userInteractionEnabled = YES;
            }
        }];
    
    [topImageView pop_addAnimation:topImageViewSpringAnimation forKey:@"topImageViewSpring"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self canceButtonClick:nil];
    
}

-(void)issueButtonClick:(UIButton *)button
{
    self.view.userInteractionEnabled = NO;
    [self removeIssueButton:^{

        NSLog(@"%ld",button.tag);
    }];

}

- (IBAction)canceButtonClick:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [self removeIssueButton:^{
        
    }];
}

-(void)removeIssueButton:(animationFished)fishedBlock
{
    for (int i = 0; i<7; i++)
    {
        UIView *tempButton = [self.view viewWithTag:1000+i];
        
        POPSpringAnimation *buttonSpringAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        
        buttonSpringAnimation.fromValue = [NSValue valueWithCGRect:CGRectMake(tempButton.x,tempButton.y , tempButton.width, tempButton.height)];
        buttonSpringAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(tempButton.x,tempButton.y + SCREEN_HEIGHT, tempButton.width, tempButton.height)];
        
        buttonSpringAnimation.springSpeed = 10;
        buttonSpringAnimation.springBounciness = 0;
        
        buttonSpringAnimation.beginTime = CACurrentMediaTime()+ i*0.1;
        [tempButton pop_addAnimation:buttonSpringAnimation forKey:[NSString stringWithFormat:@"buttonSpringOut%d",i]];
        
        if (i ==6 )
        {
            [buttonSpringAnimation setCompletionBlock:^(POPAnimation *pop, BOOL fished) {
                
                if (fished == YES)
                {
                    [self dismissViewControllerAnimated:NO completion:^{
                        
                    }];
                    
                    fishedBlock();
                }
            }];
        }
    }
    
    
    
    
    
    
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
