//
//  DiscoverModel.h
//  跟我走
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "BaseModel.h"

@interface DiscoverModel : BaseModel

@property(nonatomic,copy)NSString *voice_Picture;
@property(nonatomic,copy)NSString *ScenicPic;
@property(nonatomic,copy)NSString *ScenicMes;
@property(nonatomic,strong)NSNumber* SalePrice;
@property(nonatomic,copy)NSString *SName;
@property(nonatomic,copy)NSString *PriceNotes;
@property(nonatomic,copy)NSString *City;
@property(nonatomic,copy)NSString *Address;
@property(nonatomic,assign)NSNumber* CommentCount;

@end
