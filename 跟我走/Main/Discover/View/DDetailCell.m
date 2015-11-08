//
//  DDetailCell.m
//  跟我走
//
//  Created by mac on 15/10/27.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "DDetailCell.h"

@implementation DDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _createView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        NSLog(@"11111111111111");
    }
    return self;
}

- (void)_createView
{
    _title1 = [[UILabel alloc]initWithFrame:CGRectZero];
    _title2 = [[UILabel alloc]initWithFrame:CGRectZero];
    _title3 = [[UILabel alloc]initWithFrame:CGRectZero];
    _title1.text = @"开放时间";
    _title2.text = @"景点地点";
    _title3.text = @"景点介绍";
    _title1.font = [UIFont systemFontOfSize:15];
    _title2.font = [UIFont systemFontOfSize:15];
    _title3.font = [UIFont systemFontOfSize:15];

    [self.contentView addSubview:_title1];
    [self.contentView addSubview:_title2];
    [self.contentView addSubview:_title3];
    _note1 = [[UILabel alloc]initWithFrame:CGRectZero];
    _note2 = [[UILabel alloc]initWithFrame:CGRectZero];
    _note3 = [[UILabel alloc]initWithFrame:CGRectZero];
    _note1.font = [UIFont systemFontOfSize:13];
    _note2.font = [UIFont systemFontOfSize:13];
    _note3.font = [UIFont systemFontOfSize:13];

    [self.contentView addSubview:_note1];
    [self.contentView addSubview:_note2];
    [self.contentView addSubview:_note3];

}


- (void)setModel:(DiscoverModel *)model
{
    if (_model != model) {
        _model = model;
        [self setNeedsLayout];
    }
}

- (void)awakeFromNib {
    // Initialization code
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _title1.frame = CGRectMake(3, 0, KScreenWidth-6, 50);
    CGRect frame1 = [self boundingRect:_model.PriceNotes];
    
    _note1.frame = CGRectMake(3, _title1.bottom, KScreenWidth-6, frame1.size.height + 5);
    _note1.numberOfLines = 0;
    _note1.text = _model.PriceNotes;
    
    _title2.frame = CGRectMake(3, _note1.bottom, KScreenWidth-6, 50);
    
    _note2.frame = CGRectMake(3, _title2.bottom, KScreenWidth-6, 18);
    _note2.text = _model.Address;
    
    _title3.frame = CGRectMake(3, _note2.bottom, KScreenWidth-6, 50);
    CGRect frame3 = [self boundingRect:_model.ScenicMes];
    _note3.frame = CGRectMake(3, _title3.bottom, KScreenWidth-6, frame3.size.height + 5);
    _note3.numberOfLines = 0;
    _note3.text = _model.ScenicMes;
    NSLog(@"%@",_model.ScenicMes);
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGRect)boundingRect:(NSString *)string
{
    CGSize size=CGSizeMake(KScreenWidth-10-10, 1000);
    NSDictionary *arrtibus=@{NSFontAttributeName:[UIFont systemFontOfSize:13]};
    CGRect frame=[string boundingRectWithSize:size
                                      options:NSStringDrawingUsesLineFragmentOrigin attributes:arrtibus
                                      context:nil];
    
    return frame;

}
- (CGRect)boundingRect:(NSString *)string
{
    CGSize size=CGSizeMake(KScreenWidth-10-10, 1000);
    NSDictionary *arrtibus=@{NSFontAttributeName:[UIFont systemFontOfSize:13]};
    CGRect frame=[string boundingRectWithSize:size
                                      options:NSStringDrawingUsesLineFragmentOrigin attributes:arrtibus
                                      context:nil];
    
    return frame;
    
}
@end
