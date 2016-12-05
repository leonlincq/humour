//
//  KSCLoginTool.m
//  快上车
//
//  Created by Leonlincq on 15/8/6.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import "KSCLoginTool.h"
#import "KSCLoginRegisterViewController.h"

@implementation KSCLoginTool

+ (void)setUid:(NSString *)uid
{
    [[NSUserDefaults standardUserDefaults] setObject:uid forKey:@"uid"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getUid
{
    return [self getUid:NO];
}

+ (NSString *)getUid:(BOOL)showLoginController
{
    NSString *uid = [[NSUserDefaults standardUserDefaults] stringForKey:@"uid"];
    
    if (showLoginController) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            KSCLoginRegisterViewController *login = [[KSCLoginRegisterViewController alloc] init];
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:login animated:YES completion:nil];
        });
    }
    
    return uid;
}

@end
