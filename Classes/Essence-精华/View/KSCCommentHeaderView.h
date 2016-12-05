//
//  KSCCommentHeaderView.h
//  快上车
//
//  Created by Leonlincq on 15/8/2.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSCCommentHeaderView : UITableViewHeaderFooterView
/** 文字数据 */
@property (nonatomic, copy) NSString *title;

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;
@end
