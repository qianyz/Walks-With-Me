//
//  DiscoverCell.m
//  跟我走
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "DiscoverCell.h"
#import "UIImageView+WebCache.h"
@implementation DiscoverCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)layoutSubviews
{
    [_imageView sd_setImageWithURL:[NSURL URLWithString: _model.voice_Picture]];
    _title.text = _model.SName;
    
    _price.text = [NSString stringWithFormat:@"价格：¥%@",_model.SalePrice];
    _comments.text = [NSString stringWithFormat:@"评论：%@",[_model.CommentCount stringValue]];
    _addr.text = _model.Address;
    
}

@end
