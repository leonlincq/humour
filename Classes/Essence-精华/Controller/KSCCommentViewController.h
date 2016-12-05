//
//  KSCCommentViewController.h
//  快上车
//
//  Created by Leonlincq on 15/8/2.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KSCTopic;

@interface KSCCommentViewController : UIViewController
/** 帖子模型 */
@property (nonatomic, strong) KSCTopic *topic;
@end
