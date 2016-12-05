//
//  KSCTopicViewController.h
//  快上车
//
//  Created by Leonlincq on 15/7/27.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//  最基本的帖子控制器

#import <UIKit/UIKit.h>

@interface KSCTopicViewController : UITableViewController
/** 帖子类型(交给子类去实现) */
@property (nonatomic, assign) KSCTopicType type;
@end
