//
//  DDetailCell.h
//  跟我走
//
//  Created by mac on 15/10/27.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "WXLabel.h"
#import "DiscoverModel.h"
@interface DDetailCell : UITableViewCell

@property(nonatomic,strong)UILabel *title1;
@property(nonatomic,strong)UILabel *title2;
@property(nonatomic,strong)UILabel *title3;
@property(nonatomic,strong)UILabel *note1;
@property(nonatomic,strong)UILabel *note2;
@property(nonatomic,strong)UILabel *note3;

@property(nonatomic,strong)DiscoverModel *model;
//+ (float)getCellHeight:(DiscoverModel *)model;
+ (CGRect)boundingRect:(NSString *)string;
@end
