//
//  KSCRecommendCategoryCell.h
//  快上车
//
//  Created by Leonlincq on 15/7/23.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KSCRecommendCategory;

@interface KSCRecommendCategoryCell : UITableViewCell
/** 类别模型 */
@property (nonatomic, strong) KSCRecommendCategory *category;
@end
