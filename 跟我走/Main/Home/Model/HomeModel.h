//
//  HomeModel.h
//  跟我走
//
//  Created by mac on 15/10/23.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "BaseModel.h"

@interface HomeModel : BaseModel

@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign)NSNumber *routeDays;
@property(nonatomic,copy)NSString *headImage;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,assign)NSNumber *likeCount;
@property(nonatomic,assign)NSNumber *commentCount;
@property(nonatomic,assign)NSNumber *viewCount;
@property(nonatomic,copy)NSString *userHeadImg;

@end
