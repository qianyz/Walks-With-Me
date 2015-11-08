//
//  BaseModel.h
//  跟我走
//
//  Created by mac on 15/10/21.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
//初始化方法
- (id)initWithDataDic:(NSDictionary*)dataDic;

//属性映射字典
- (NSDictionary*)attributeMapDictionary;

//设置属性
- (void)setAttributes:(NSDictionary*)dataDic;
@end
