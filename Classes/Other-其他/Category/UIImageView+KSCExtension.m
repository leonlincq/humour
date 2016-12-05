//
//  UIImageView+KSCExtension.m
//  快上车
//
//  Created by Leonlincq on 15/8/3.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import "UIImageView+KSCExtension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (KSCExtension)
- (void)setHeader:(NSString *)url
{
    UIImage *placeholder = [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = image ? [image circleImage] : placeholder;
    }];
}
@end
