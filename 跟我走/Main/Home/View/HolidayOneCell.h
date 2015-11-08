//
//  HolidayOneCell.h
//  跟我走
//
//  Created by mac on 15/10/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HolidayModel.h"
@interface HolidayOneCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *minPrice;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCount;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet UILabel *startCity;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *data;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *days;

@property(nonatomic,strong)HolidayModel *model;
@end
