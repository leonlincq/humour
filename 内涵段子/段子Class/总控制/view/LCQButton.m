//
//  LCQButton.m
//  内涵段子
//
//  Created by Leonlincq on 16/11/17.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "LCQButton.h"

@implementation LCQButton

- (void)setUp
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
//代码
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

//XIB
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //    设置图片位置
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.width;
    
    //    设置文字位置
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}


/*
 // Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
