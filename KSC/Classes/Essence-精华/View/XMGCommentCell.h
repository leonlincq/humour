//
//  XMGCommentCell.h
//  01-百思不得姐
//
//  Created by xiaomage on 15/8/2.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMGComment;

@interface XMGCommentCell : UITableViewCell
/** 评论 */
@property (nonatomic, strong) XMGComment *comment;
@end
