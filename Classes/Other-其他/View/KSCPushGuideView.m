//
//  KSCPushGuideView.m
//  快上车
//
//  Created by Leonlincq on 15/7/26.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import "KSCPushGuideView.h"

@implementation KSCPushGuideView

+ (void)show
{
    NSString *key = @"CFBundleShortVersionString";
    
    // 获得当前软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    // 获得沙盒中存储的版本号
    NSString *sanboxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
//    [NSUserDefaults standardUserDefaults] stringForKey:<#(nonnull NSString *)#>
    
    if (![currentVersion isEqualToString:sanboxVersion]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        KSCPushGuideView *guideView = [KSCPushGuideView viewFromXib];
        guideView.frame = window.bounds;
        [window addSubview:guideView];
        
        // 存储版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (IBAction)close {
    [self removeFromSuperview];
}
@end
