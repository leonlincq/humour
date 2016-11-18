//
//  LCQEssenceViewController.m
//  内涵段子
//
//  Created by Leonlincq on 16/11/11.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "LCQEssenceViewController.h"

#import "LCQALLDataTableViewController.h"
#import "LCQVideoDataTableViewController.h"
#import "LCQPicDataTableViewController.h"
#import "LCQTextDataTableViewController.h"
#import "LCQAudioDataTableViewController.h"


@interface LCQEssenceViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIView *selectView;            //红色的选择View
@property (nonatomic,strong) UIView *secFakeNaviView;       //第二个假导航栏
@property (nonatomic,strong) UIButton *selectButton;        //第二个假导航栏选择的按钮
@property (nonatomic,strong) UIScrollView *dataScrollView;  //ScrollView

@end

@implementation LCQEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //设置真的导航栏
    [self setRealNavi];
    //设置第二个假导航栏对应的子ViewControl
    [self setUpChildTableViewControl];
    //设置第二个假导航栏
    [self setUpSecNavi];
    //设置ScrollView
    [self setUpScrollView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 导航栏左边按钮事件
- (void)theEssenceLeftBarButton:(UIButton *)leftButton
{
    NSLOGFUNC;
}

#pragma mark - 第二个假导航栏对应的子ViewControl
-(void)setUpChildTableViewControl
{
    LCQALLDataTableViewController *allDataViewCtr = [[LCQALLDataTableViewController alloc]init];
    [self addChildViewController:allDataViewCtr];
    
    LCQVideoDataTableViewController *videoDataViewCtr = [[LCQVideoDataTableViewController alloc]init];
    [self addChildViewController:videoDataViewCtr];
    
    LCQPicDataTableViewController *picDataViewCtr = [[LCQPicDataTableViewController alloc]init];
    [self addChildViewController:picDataViewCtr];
    
    LCQTextDataTableViewController *textDataViewCtr = [[LCQTextDataTableViewController alloc]init];
    [self addChildViewController:textDataViewCtr];
    
    LCQAudioDataTableViewController *audioDataViewCtr = [[LCQAudioDataTableViewController alloc]init];
    [self addChildViewController:audioDataViewCtr];

}

#pragma mark - 真的导航栏
-(void)setRealNavi
{
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"MainTagSubIcon" andHightImageName:@"MainTagSubIconClick" addTarget:self action:@selector(theEssenceLeftBarButton:)];
}

#pragma mark - 第二个假导航栏
#define SECNAVI_X 0
#define SECNAVI_Y 0
#define SECNAVI_WIDTH SCREEN_WIDTH
#define SECNAVI_HEIGH 44
-(void)setUpSecNavi
{
    //SecNavi
    UIView *secNaviView = [[UIView alloc]initWithFrame:CGRectMake(SECNAVI_X, SECNAVI_Y, SECNAVI_WIDTH, SECNAVI_HEIGH)];

    secNaviView.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.7];

    
    //RedView
    UIView *redView = [[UIView alloc]init];
    redView.height = 2;
    redView.y = SECNAVI_HEIGH - 2;
    
    redView.backgroundColor = [UIColor redColor];
    
    [secNaviView addSubview:redView];
    self.selectView = redView;
    
    //Button
    NSArray *secNaviNameArray = @[@"全部",@"视频",@"图片",@"段子",@"声音"];
    
    CGFloat buttonWidth = SECNAVI_WIDTH/secNaviNameArray.count;
    CGFloat buttonHeight = SECNAVI_HEIGH;
    CGFloat buttonY = 0;
    
    for (int i = 0; i<secNaviNameArray.count; i++)
    {

        UIButton *tempButton = [[UIButton alloc]initWithFrame:CGRectMake(buttonWidth *i, buttonY, buttonWidth, buttonHeight)];
        
        tempButton.tag = i;
        
        [tempButton setTitle:secNaviNameArray[i] forState:UIControlStateNormal];
        [tempButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [tempButton addTarget:self action:@selector(secButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
//        [tempButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [tempButton setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        
        [secNaviView addSubview:tempButton];
        
        if( i == 0)
        {
            [tempButton layoutIfNeeded];
            tempButton.enabled = NO;
            self.selectButton = tempButton;
            redView.x = tempButton.centerX- tempButton.titleLabel.width/2;
            redView.width = tempButton.titleLabel.width;

        }
    }
    
    [self.view addSubview:secNaviView];
    self.secFakeNaviView = secNaviView;
}

#pragma mark - 设置ScrollView
-(void)setUpScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT- 64 )];
    
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 5, 0);
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    
    [self.view insertSubview:scrollView atIndex:0];
    
    scrollView.delegate = self;
    
    self.dataScrollView = scrollView;
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

#pragma mark - 第二个假导航栏的按钮事件
-(void)secButtonClick:(UIButton *)button
{

//    self.selectButton.selected = NO;
    self.selectButton.enabled = YES;
    
    self.selectButton = button;
    
//    button.selected = YES;
    button.enabled = NO;
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.selectView.centerX  = button.centerX;
//        self.redView.y = SECNAVI_HEIGH -2;
        self.selectView.width = button.titleLabel.width;
//        self.redView.height = 2;
    }];
    
//    self.dataScrollView.contentOffset = CGPointMake(button.tag * SCREEN_WIDTH, 0);

    CGPoint tempPoint = self.dataScrollView.contentOffset;
    tempPoint.x = button.tag * SCREEN_WIDTH;
    [self.dataScrollView setContentOffset:tempPoint animated:YES];
}

#pragma mark - 代理：ScrollView减速动画结束，通过setContentOffset:animated来调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/SCREEN_WIDTH;

    UITableViewController *tempTBViewCtr = self.childViewControllers[index];
    
    tempTBViewCtr.tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(self.secFakeNaviView.frame), 0, 49, 0);
    
    tempTBViewCtr.view.x = scrollView.contentOffset.x;
    tempTBViewCtr.view.y = 0;
    tempTBViewCtr.view.width = scrollView.width;
    tempTBViewCtr.view.height = scrollView.height;
    
    [scrollView addSubview:tempTBViewCtr.view];
}

#pragma mark - 代理：ScrollView减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    NSInteger index = scrollView.contentOffset.x/SCREEN_WIDTH + 1;
    
    UIButton *tempButoon = self.secFakeNaviView.subviews[index];
    [self secButtonClick:tempButoon];
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
