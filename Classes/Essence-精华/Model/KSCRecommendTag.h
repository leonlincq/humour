//
//  KSCRecommendTag.h
//  快上车
//
//  Created by Leonlincq on 15/7/23.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSCRecommendTag : NSObject
/** 图片 */
@property (nonatomic, copy) NSString *image_list;
/** 名字 */
@property (nonatomic, copy) NSString *theme_name;
/** 订阅数 */
@property (nonatomic, assign) NSInteger sub_number;
@end
