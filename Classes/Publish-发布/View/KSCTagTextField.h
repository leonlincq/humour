//
//  KSCTagTextField.h
//  快上车
//
//  Created by Leonlincq on 15/8/5.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSCTagTextField : UITextField
/** 按了删除键后的回调 */
@property (nonatomic, copy) void (^deleteBlock)();
@end
