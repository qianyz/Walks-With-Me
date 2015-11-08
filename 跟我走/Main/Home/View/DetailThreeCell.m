//
//  DetailThreeCell.m
//  跟我走
//
//  Created by mac on 15/10/24.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "DetailThreeCell.h"

@implementation DetailThreeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _createViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)_createViews
{
    _titelLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    _titelLabel.text = @"推荐旅游路线:";
    [self.contentView addSubview:_titelLabel];

    _textLabel = [[WXLabel alloc]initWithFrame:CGRectZero];
    _textLabel.linespace = 5;
    [self.contentView addSubview:_textLabel];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat height = [WXLabel getTextHeight:14.0f
                                      width:240
                                       text:_model.text
                                  linespace:5];
    _textLabel.frame = CGRectMake(0, 40, KScreenWidth, height);
    _textLabel.text = _model.text;
}

+ (float)getCellHeight:(HomeModel *)model {
    CGFloat height = [WXLabel getTextHeight:14.0f
                                      width:KScreenWidth-70
                                       text:model.text
                                  linespace:5];
    
    return height+80;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
