//
//  DetailOneCell.m
//  跟我走
//
//  Created by mac on 15/10/23.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "DetailOneCell.h"

@implementation DetailOneCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _titleLabel.text = _model.title;
    _likeLabel.text = [NSString stringWithFormat:@"喜欢人数:%@",[_model.likeCount stringValue] ];
    _lookLabel.text = [NSString stringWithFormat:@"浏览数:%@",[_model.viewCount stringValue] ];
    
    _commentLabel.text = [NSString stringWithFormat:@"评论数:%@",[_model.commentCount stringValue] ];
    
}
@end
