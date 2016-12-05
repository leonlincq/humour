//
//  KSCTopicCell.h
//  快上车
//
//  Created by Leonlincq on 15/7/27.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KSCTopic;
@interface KSCTopicCell : UITableViewCell
/** 帖子数据 */
@property (nonatomic, strong) KSCTopic *topic;
@end
