//
//  DetailTwoCell.h
//  跟我走
//
//  Created by mac on 15/10/23.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface DetailTwoCell : UITableViewCell

{
    UILabel *_userNameLabel;
    UIImageView *_userImage;
}
@property(nonatomic,strong)HomeModel *model;

@end
