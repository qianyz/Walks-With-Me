//
//  DetailTwoCell.m
//  跟我走
//
//  Created by mac on 15/10/23.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "DetailTwoCell.h"
#import "UIImageView+WebCache.h"
@implementation DetailTwoCell

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
    _userImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 0, 40, 40)];
    [self addSubview:_userImage];
    _userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 0, 250, 40)];
    [self addSubview:_userNameLabel];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_userImage sd_setImageWithURL:[NSURL URLWithString:_model.userHeadImg]];
    _userNameLabel.text = _model.userName;
   
}

@end
