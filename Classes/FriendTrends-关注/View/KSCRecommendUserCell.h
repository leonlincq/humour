//
//  KSCRecommendUserCell.h
//  快上车
//
//  Created by Leonlincq on 15/7/23.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KSCRecommendUser;

@interface KSCRecommendUserCell : UITableViewCell
/** 用户模型 */
@property (nonatomic, strong) KSCRecommendUser *user;
@end
