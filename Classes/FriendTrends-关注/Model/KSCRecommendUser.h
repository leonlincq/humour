//
//  KSCRecommendUser.h
//  快上车
//
//  Created by Leonlincq on 15/7/23.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSCRecommendUser : NSObject
/** 头像 */
@property (nonatomic, copy) NSString *header;
/** 粉丝数(有多少人关注这个用户) */
@property (nonatomic, assign) NSInteger fans_count;
/** 昵称 */
@property (nonatomic, copy) NSString *screen_name;
@end
