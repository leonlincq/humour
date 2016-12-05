//
//  KSCTextField.m
//  快上车
//
//  Created by Leonlincq on 15/7/26.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import "KSCTextField.h"

static NSString * const KSCPlacerholderColorKeyPath = @"_placeholderLabel.textColor";

@implementation KSCTextField

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // 设置光标颜色和文字颜色一致
    self.tintColor = self.textColor;
    
    // 不成为第一响应者
    [self resignFirstResponder];
}

/**
 * 当前文本框聚焦时就会调用
 */
- (BOOL)becomeFirstResponder
{
    // 修改占位文字颜色
    [self setValue:self.textColor forKeyPath:KSCPlacerholderColorKeyPath];
    return [super becomeFirstResponder];
}

/**
 * 当前文本框失去焦点时就会调用
 */
- (BOOL)resignFirstResponder
{
    // 修改占位文字颜色
    [self setValue:[UIColor grayColor] forKeyPath:KSCPlacerholderColorKeyPath];
    return [super resignFirstResponder];
}

/**
 运行时(Runtime): 
 * 苹果官方一套C语言库
 * 能做很多底层操作(比如访问隐藏的一些成员变量\成员方法....)
 */

@end
