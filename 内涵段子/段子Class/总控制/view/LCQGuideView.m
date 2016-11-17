//
//  LCQGuideView.m
//  内涵段子
//
//  Created by etcxm on 16/11/17.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "LCQGuideView.h"

@implementation LCQGuideView

+ (instancetype)loadGuideXib
{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (IBAction)removeGuide:(id)sender
{
    [self removeFromSuperview];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
