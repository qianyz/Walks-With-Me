//
//  HomeCell.h
//  跟我走
//
//  Created by mac on 15/10/21.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface HomeCell : UICollectionViewCell
{
    UIView *_bgview;
    UILabel *_titleLabel;
    UIImageView *_imageView;
    UILabel *_bottomLabel;
}
@property(nonatomic,strong)HomeModel *model;
@end
