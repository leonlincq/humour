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
#import <SDImageCache.h>
#import "KSCLoginRegisterViewController.h"

@implementation KSCMeViewController

static NSString *KSCMeId = @"me";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:1]] withRowAnimation:UITableViewRowAnimationFade];
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
//    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
//    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
//    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
}

//- (void)settingClick
//{
//    [self.navigationController pushViewController:[[KSCSettingViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
//}

//- (void)moonClick
//{
//    KSCLogFunc;
//}

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
        
        CGFloat size = [SDImageCache sharedImageCache].getSize / 1000.0 / 1000;
        cell.textLabel.text = [NSString stringWithFormat:@"清除缓存（已使用%.2fMB）", size];
        
    } else if (indexPath.section == 2) {
        cell.textLabel.text = @"关于作者:林承权";
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        KSCLoginRegisterViewController *login = [[KSCLoginRegisterViewController alloc] init];
        [self presentViewController:login animated:YES completion:nil];
    }
    if (indexPath.section == 1)
    {
        [[SDImageCache sharedImageCache] clearDisk];
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    if (indexPath.section == 2)
    {
        LCQViewController *lcqView = [[LCQViewController alloc]init];
        
        [self.navigationController pushViewController:lcqView animated:YES];
    }
    
}

- (void)getSize
{
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *cachePath = [caches stringByAppendingPathComponent:@"default/com.hackemist.SDWebImageCache.default"];
    
    NSDirectoryEnumerator *fileEnumerator = [manager enumeratorAtPath:cachePath];
    NSInteger totalSize = 0;
    for (NSString *fileName in fileEnumerator) {
        NSString *filepath = [cachePath stringByAppendingPathComponent:fileName];
        
        //        BOOL dir = NO;
        // 判断文件的类型：文件\文件夹
        //        [manager fileExistsAtPath:filepath isDirectory:&dir];
        //        if (dir) continue;
        NSDictionary *attrs = [manager attributesOfItemAtPath:filepath error:nil];
        if ([attrs[NSFileType] isEqualToString:NSFileTypeDirectory]) continue;
        
        totalSize += [attrs[NSFileSize] integerValue];
    }
    KSCLog(@"%zd", totalSize);
}

- (void)getSize2
{
    // 图片缓存
    //    NSUInteger size = [SDImageCache sharedImageCache].getSize;
    //    KSCLog(@"%zd %@", size, NSTemporaryDirectory());
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 文件夹
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *cachePath = [caches stringByAppendingPathComponent:@"default/com.hackemist.SDWebImageCache.default"];
    
    // 获得文件夹内部的所有内容
    //    NSArray *contents = [manager contentsOfDirectoryAtPath:cachePath error:nil];
    NSArray *subpaths = [manager subpathsAtPath:cachePath];
    KSCLog(@"%@", subpaths);
}
@end
