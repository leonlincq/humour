//
//  KSCCommentHeaderView.m
//  快上车
//
//  Created by Leonlincq on 15/8/2.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import "KSCCommentHeaderView.h"

@interface KSCCommentHeaderView()
/** 文字标签 */
@property (nonatomic, weak) UILabel *label;
@end

@implementation KSCCommentHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"header";
    KSCCommentHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) { // 缓存池中没有, 自己创建
        header = [[KSCCommentHeaderView alloc] initWithReuseIdentifier:ID];
    }
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = KSCGlobalBg;
        
        // 创建label
        UILabel *label = [[UILabel alloc] init];
        label.textColor = KSCRGBColor(67, 67, 67);
        label.width = 200;
        label.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [self.contentView addSubview:label];
        self.label = label;
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    
    self.label.text = title;
}

@end
