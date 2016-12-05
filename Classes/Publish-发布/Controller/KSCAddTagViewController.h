//
//  KSCAddTagViewController.h
//  快上车
//
//  Created by Leonlincq on 15/8/5.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSCAddTagViewController : UIViewController
/** 获取tags的block */
@property (nonatomic, copy) void (^tagsBlock)(NSArray *tags);

/** 所有的标签 */
@property (nonatomic, strong) NSArray *tags;
@end
