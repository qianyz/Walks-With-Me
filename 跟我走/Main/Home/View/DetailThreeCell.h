//
//  DetailThreeCell.h
//  跟我走
//
//  Created by mac on 15/10/24.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "WXLabel.h"
@interface DetailThreeCell : UITableViewCell
{
    WXLabel *_textLabel;
    UILabel *_titelLabel;
    
}

@property(nonatomic,strong)HomeModel *model;

+ (float)getCellHeight:(HomeModel *)model;

@end
