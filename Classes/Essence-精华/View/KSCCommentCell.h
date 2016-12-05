//
//  KSCCommentCell.h
//  快上车
//
//  Created by Leonlincq on 15/8/2.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KSCComment;

@interface KSCCommentCell : UITableViewCell
/** 评论 */
@property (nonatomic, strong) KSCComment *comment;
@end
