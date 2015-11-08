//
//  HolidayDetailCell.m
//  跟我走
//
//  Created by mac on 15/11/6.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HolidayDetailCell.h"

@implementation HolidayDetailCell

- (void)setModel:(HolidayModel *)model
{
    if (_model != model) {
        _model = model;
        [self setNeedsLayout];

    }
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _messageLabel.text = [NSString stringWithFormat:@"%@ %@",_model.title,_model.subTitle];
    NSLog(@"%@",_messageLabel);
    _priceLabel.text = [NSString stringWithFormat:@"¥%@",_model.minPrice];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
