//
//  HolidayDetailCell.h
//  跟我走
//
//  Created by mac on 15/11/6.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HolidayModel.h"
@interface HolidayDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *evaluateLabel;//评价
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *salesLabel;

@property(nonatomic,strong)HolidayModel *model;


@end
