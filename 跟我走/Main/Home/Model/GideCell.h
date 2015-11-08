//
//  GideCell.h
//  跟我走
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GideModel.h"
@interface GideCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *sub_title;

@property(nonatomic,strong)GideModel *model;
@end
