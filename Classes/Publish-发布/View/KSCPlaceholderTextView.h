//
//  KSCPlaceholderTextView.h
//  快上车
//
//  Created by Leonlincq on 15/8/5.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//  拥有占位文字功能的TextView

#import <UIKit/UIKit.h>

@interface KSCPlaceholderTextView : UITextView
/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字的颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;
@end
