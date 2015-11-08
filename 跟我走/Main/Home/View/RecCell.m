//
//  RecCell.m
//  跟我走
//
//  Created by mac on 15/10/29.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "RecCell.h"
#import "UIImageView+WebCache.h"
@implementation RecCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        CGFloat a = KScreenWidth-20;
        NSLog(@"==============%f",a);
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)layoutSubviews
{
    [_image sd_setImageWithURL:[NSURL URLWithString:_model.imgUrl]];
    _title.text = _model.title;
    _type.text = [NSString stringWithFormat:@"%@|%@出发",_model.productTypeName,_model.departCityName];
    
    _type.layer.backgroundColor = [UIColor colorWithWhite:0 alpha:.5].CGColor;
    _type.layer.cornerRadius = 9;
    
    _type.textColor = [UIColor whiteColor];
    _subTitle.text = _model.subTitle;
    _price.text = [NSString stringWithFormat:@"¥%@",_model.promotionPrice];
    _view.layer.cornerRadius = 30;
    _view.backgroundColor = [UIColor orangeColor];
    _view.layer.borderColor = [UIColor whiteColor].CGColor;
    _view.layer.borderWidth = 2;
    
}

@end
