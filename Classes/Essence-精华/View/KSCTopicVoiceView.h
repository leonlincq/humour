//
//  KSCTopicVoiceView.h
//  快上车
//
//  Created by Leonlincq on 15/7/30.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//  声音帖子中间的内容

#import <UIKit/UIKit.h>
@class KSCTopic;


@interface KSCTopicVoiceView : UIView
/** 帖子数据 */
@property (nonatomic, strong) KSCTopic *topic;
@end
