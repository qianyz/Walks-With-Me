//
//  DiscoverCell.h
//  跟我走
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiscoverModel.h"
@interface DiscoverCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *addr;
@property (weak, nonatomic) IBOutlet UILabel *comments;

@property(nonatomic,strong)DiscoverModel *model;
@end
