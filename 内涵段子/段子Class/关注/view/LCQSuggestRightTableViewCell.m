//
//  LCQSuggestRightTableViewCell.m
//  内涵段子
//
//  Created by Leonlincq on 16/11/15.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "LCQSuggestRightTableViewCell.h"
#import "LCQSuggestRightModel.h"

@interface LCQSuggestRightTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userIconImageview;

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *userFansLabel;

@property (weak, nonatomic) IBOutlet UIButton *AttentionButton;

@end



@implementation LCQSuggestRightTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [_AttentionButton.layer setBorderWidth:1.0];
    [_AttentionButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [_AttentionButton.layer setCornerRadius:4.0];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(LCQSuggestRightModel *)model
{
    self.userNameLabel.text = model.screen_name;
    [self.userIconImageview sd_setImageWithURL:[NSURL URLWithString:model.header] placeholderImage:nil];
    self.userFansLabel.text = [NSString stringWithFormat:@"%@人关注",model.fans_count];

}


@end
