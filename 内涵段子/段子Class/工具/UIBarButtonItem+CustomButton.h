//
//  UIBarButtonItem+CustomButton.h
//  内涵段子
//
//  Created by Leonlincq on 16/11/15.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CustomButton)

+ (instancetype)itemWithImageName:(NSString *)imagename andHightImageName:(NSString *)heightimagename addTarget:(id)target action:(SEL)action;

@end
