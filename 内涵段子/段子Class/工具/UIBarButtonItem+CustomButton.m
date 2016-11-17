//
//  UIBarButtonItem+CustomButton.m
//  内涵段子
//
//  Created by Leonlincq on 16/11/15.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "UIBarButtonItem+CustomButton.h"

@implementation UIBarButtonItem (CustomButton)

+ (instancetype)itemWithImageName:(NSString *)imagename andHightImageName:(NSString *)heightimagename addTarget:(nullable id)target action:(SEL)action
{
    UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [tempButton setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
    [tempButton setImage:[UIImage imageNamed:heightimagename] forState:UIControlStateHighlighted];
    tempButton.size = tempButton.currentImage.size;
    
    [tempButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc]initWithCustomView:tempButton];
}



@end
