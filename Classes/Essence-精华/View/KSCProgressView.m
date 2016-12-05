//
//  KSCProgressView.m
//  快上车
//
//  Created by Leonlincq on 15/7/29.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import "KSCProgressView.h"

@implementation KSCProgressView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.roundedCorners = 2;
    self.progressLabel.textColor = [UIColor whiteColor];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    [super setProgress:progress animated:animated];
    
    NSString *text = [NSString stringWithFormat:@"%.0f%%", progress * 100];
    self.progressLabel.text = [text stringByReplacingOccurrencesOfString:@"-" withString:@""];
}

@end
