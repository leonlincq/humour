//
//  KSCMeViewController.m
//  快上车
//
//  Created by Leonlincq on 15/7/22.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import "KSCMeViewController.h"
#import "KSCMeCell.h"
#import "KSCMeFooterView.h"
#import "KSCSettingViewController.h"
#import "LCQViewController.h"

@implementation KSCMeViewController

static NSString *KSCMeId = @"me";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupTableView];
}

- (void)setupTableView
{
    // 设置背景色
    self.tableView.backgroundColor = KSCGlobalBg;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[KSCMeCell class] forCellReuseIdentifier:KSCMeId];
    
    // 调整header和footer
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = KSCTopicCellMargin;
    
    // 调整inset
    self.tableView.contentInset = UIEdgeInsetsMake(KSCTopicCellMargin - 35, 0, 0, 0);
    
    // 设置footerView
    self.tableView.tableFooterView = [[KSCMeFooterView alloc] init];
    self.tableView.delegate = self;
}

- (void)setupNav
{
    // 设置导航栏标题
    self.navigationItem.title = @"我的";
    
    // 设置导航栏右边的按钮
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
}

- (void)settingClick
{
    [self.navigationController pushViewController:[[KSCSettingViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
}

- (void)moonClick
{
    KSCLogFunc;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KSCMeCell *cell = [tableView dequeueReusableCellWithIdentifier:KSCMeId];
    
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"mine_icon_nearby"];
        cell.textLabel.text = @"登录/注册";
    } else if (indexPath.section == 1) {
        cell.textLabel.text = @"离线下载";
    } else if (indexPath.section == 2) {
        cell.textLabel.text = @"关于作者:林承权";
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2)
    {
        LCQViewController *lcqView = [[LCQViewController alloc]init];
        
        [self.navigationController pushViewController:lcqView animated:YES];
    }
    
}


@end
