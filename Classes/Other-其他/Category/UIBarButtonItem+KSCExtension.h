//
//  UIBarButtonItem+KSCExtension.h
//  快上车
//
//  Created by Leonlincq on 15/7/22.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (KSCExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
