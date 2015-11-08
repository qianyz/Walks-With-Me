//
//  GideCell.m
//  跟我走
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "GideCell.h"
#import "UIImageView+WebCache.h"
@implementation GideCell

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
    
    [super layoutSubviews];
    [_image sd_setImageWithURL:[NSURL URLWithString:_model.img_url]];
    _title.text = _model.title;
    _sub_title.text = _model.sub_title;
    
}
@end
