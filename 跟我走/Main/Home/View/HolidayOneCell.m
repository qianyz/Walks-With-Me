//
//  HolidayOneCell.m
//  跟我走
//
//  Created by mac on 15/10/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HolidayOneCell.h"
#import "UIImageView+WebCache.h"
@implementation HolidayOneCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(HolidayModel *)model{
    if (_model != model) {
        _model = model;
        [self setNeedsLayout];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_img sd_setImageWithURL:[NSURL URLWithString:_model.img]];
    
    _title.text = _model.title;
    
    _subTitle.text = _model.subTitle;
    
    _favoriteCount.text =[NSString stringWithFormat:@"%@", _model.FavoriteCount ];
    
    _startCity.text = _model.startCity;
    
    _days.text = [NSString stringWithFormat:@"%@days",_model.C_days];
    
    _minPrice.text = [NSString stringWithFormat:@"¥%@",_model.minPrice];
    if (_model.C_DateEnd == nil) {
        _data.text = _model.C_DateBeg;
    }else if(_model.C_DateEnd != nil){
        _data.text = [NSString stringWithFormat:@"%@-%@",_model.C_DateBeg,_model.C_DateEnd];
    }
    
    
}

@end
