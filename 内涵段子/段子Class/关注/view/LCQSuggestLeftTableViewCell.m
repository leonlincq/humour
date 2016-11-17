//
//  LCQSuggestLeftTableViewCell.m
//  内涵段子
//
//  Created by Leonlincq on 16/11/15.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "LCQSuggestLeftTableViewCell.h"
#import "LCQSuggestLeftModel.h"

@interface LCQSuggestLeftTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation LCQSuggestLeftTableViewCell


-(void)setModel:(LCQSuggestLeftModel *)model
{
    self.textLabel.text = model.name;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textLabel.y = 1;
    self.textLabel.height = self.contentView.height - 2*self.textLabel.y;
    

}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
//    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.redView.hidden = !selected;
    self.textLabel.textColor = selected?[UIColor redColor]:[UIColor blackColor];
    self.backgroundColor = selected?[UIColor whiteColor]:ALLVIEWBGCOLOR;
    
    // Configure the view for the selected state
}

@end
