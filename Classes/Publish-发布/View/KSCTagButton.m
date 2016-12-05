//
//  KSCTagButton.m
//  快上车
//
//  Created by Leonlincq on 15/8/5.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import "KSCTagButton.h"

@implementation KSCTagButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"chose_tag_close_icon"] forState:UIControlStateNormal];
        self.backgroundColor = KSCTagBg;
        self.titleLabel.font = KSCTagFont;
    }
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    [self sizeToFit];
    
    self.width += 3 * KSCTagMargin;
    self.height = KSCTagH;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.x = KSCTagMargin;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + KSCTagMargin;
}

@end
