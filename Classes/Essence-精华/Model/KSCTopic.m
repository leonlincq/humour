//
//  KSCTopic.m
//  快上车
//
//  Created by Leonlincq on 15/7/27.
//  Copyright (c) 2015年 Leonlincq. All rights reserved.
//

#import "KSCTopic.h"
#import "KSCComment.h"
#import "KSCUser.h"
#import <MJExtension.h>

@implementation KSCTopic
{
    CGFloat _cellHeight;
}

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{
             @"small_image" : @"image0",
             @"large_image" : @"image1",
             @"middle_image" : @"image2",
             @"ID" : @"id",
             @"top_cmt" : @"top_cmt[0]" //,
//             @"qzone_uid" : @"top_cmt[0].user.qzone_uid"
             };
}

- (NSString *)create_time
{
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式(y:年,M:月,d:日,H:时,m:分,s:秒)
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 帖子的创建时间
    NSDate *create = [fmt dateFromString:_create_time];
    
    if (create.isThisYear) { // 今年
        if (create.isToday) { // 今天
            NSDateComponents *cmps = [[NSDate date] deltaFrom:create];
            
            if (cmps.hour >= 1) { // 时间差距 >= 1小时
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) { // 1小时 > 时间差距 >= 1分钟
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else { // 1分钟 > 时间差距
                return @"刚刚";
            }
        } else if (create.isYesterday) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return [fmt stringFromDate:create];
        } else { // 其他
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:create];
        }
    } else { // 非今年
        return _create_time;
    }
}

- (CGFloat)cellHeight
{
    if (!_cellHeight) {
        // 文字的最大尺寸
        CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 2 * KSCTopicCellMargin, MAXFLOAT);
        // 计算文字的高度
        CGFloat textH = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
        
        // cell的高度
        // 文字部分的高度
        _cellHeight = KSCTopicCellTextY + textH + KSCTopicCellMargin;
        
        // 根据段子的类型来计算cell的高度
        if (self.type == KSCTopicTypePicture) { // 图片帖子
            if (self.width != 0 && self.height != 0) {
                // 图片显示出来的宽度
                CGFloat pictureW = maxSize.width;
                // 显示显示出来的高度
                CGFloat pictureH = pictureW * self.height / self.width;
                if (pictureH >= KSCTopicCellPictureMaxH) { // 图片高度过长
                    pictureH = KSCTopicCellPictureBreakH;
                    self.bigPicture = YES; // 大图
                }
                
                // 计算图片控件的frame
                CGFloat pictureX = KSCTopicCellMargin;
                CGFloat pictureY = KSCTopicCellTextY + textH + KSCTopicCellMargin;
                _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
                
                _cellHeight += pictureH + KSCTopicCellMargin;
            }
        } else if (self.type == KSCTopicTypeVoice) { // 声音帖子
            CGFloat voiceX = KSCTopicCellMargin;
            CGFloat voiceY = KSCTopicCellTextY + textH + KSCTopicCellMargin;
            CGFloat voiceW = maxSize.width;
            CGFloat voiceH = voiceW * self.height / self.width;
            _voiceF = CGRectMake(voiceX, voiceY, voiceW, voiceH);
            
            _cellHeight += voiceH + KSCTopicCellMargin;
        } else if (self.type == KSCTopicTypeVideo) { // 视频帖子
            CGFloat videoX = KSCTopicCellMargin;
            CGFloat videoY = KSCTopicCellTextY + textH + KSCTopicCellMargin;
            CGFloat videoW = maxSize.width;
            CGFloat videoH = videoW * self.height / self.width;
            _videoF = CGRectMake(videoX, videoY, videoW, videoH);
            
            _cellHeight += videoH + KSCTopicCellMargin;
        }
        
        // 如果有最热评论
        if (self.top_cmt) {
            NSString *content = [NSString stringWithFormat:@"%@ : %@", self.top_cmt.user.username, self.top_cmt.content];
            CGFloat contentH = [content boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil].size.height;
            _cellHeight += KSCTopicCellTopCmtTitleH + contentH + KSCTopicCellMargin;
        }
    
        // 底部工具条的高度
        _cellHeight += KSCTopicCellBottomBarH + KSCTopicCellMargin;
    }
    return _cellHeight;
}

@end
