//
//  KSCMeCell.m
//  快上车
//
//  Created by Leonlincq on 15/8/3.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import "KSCMeCell.h"

@implementation KSCMeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView *bgView = [[UIImageView alloc] init];
        bgView.image = [UIImage imageNamed:@"mainCellBackground"];
        self.backgroundView = bgView;
        
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.textLabel.font = [UIFont systemFontOfSize:16];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.imageView.image == nil) return;
    
    self.imageView.width = 30;
    self.imageView.height = self.imageView.width;
    self.imageView.centerY = self.contentView.height * 0.5;
    
    self.textLabel.x = CGRectGetMaxX(self.imageView.frame) + KSCTopicCellMargin;
}
//- (void)setFrame:(CGRect)frame
//{
////    KSCLog(@"%@", NSStringFromCGRect(frame));
//    frame.origin.y -= (35 - KSCTopicCellMargin);
//    [super setFrame:frame];
//}

@end
