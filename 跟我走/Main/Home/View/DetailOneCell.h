//
//  DetailOneCell.h
//  跟我走
//
//  Created by mac on 15/10/23.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface DetailOneCell : UITableViewCell

@property(nonatomic,strong)HomeModel *model;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *lookLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@end
