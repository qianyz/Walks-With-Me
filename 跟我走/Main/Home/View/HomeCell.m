//
//  HomeCell.m
//  跟我走
//
//  Created by mac on 15/10/21.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HomeCell.h"
#import "UIImageView+WebCache.h"
@implementation HomeCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createView];
        
    }
    return self;
    
}
- (void)awakeFromNib {
}
- (void)_createView
{
    _bgview = [[UIView alloc]initWithFrame:CGRectMake(5, 25, self.bounds.size.width-10, self.bounds.size.height-30)];
    [self.viewForBaselineLayout addSubview:_bgview];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, _bgview.bounds.size.width, _bgview.bounds.size.height-20)];
    
    [_bgview addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 250, 20)];
    _titleLabel.font = [UIFont systemFontOfSize:13];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [_bgview addSubview:_titleLabel];
    
    _bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(_titleLabel.right, 0 ,40, 20)];
    _bottomLabel.font = [UIFont systemFontOfSize:13];
    _bottomLabel.textAlignment = NSTextAlignmentCenter;
    [_bgview addSubview:_bottomLabel];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _titleLabel.text = _model.title;

    [_imageView sd_setImageWithURL:[NSURL URLWithString:_model.headImage]];
    _bottomLabel.text = [NSString stringWithFormat:@"%@Day", [_model.routeDays stringValue]];
    
}
@end
