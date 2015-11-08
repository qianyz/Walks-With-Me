//
//  DataService.h
//  跟我走
//
//  Created by mac on 15/11/6.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BlockType)(id result);

@interface DataService : NSObject

+ (void)requestUrl:(NSString *)urlString //url
        httpMethod:(NSString *)method //GET  POST
           apiKey :(NSString *)apikey
            params:(NSMutableDictionary *)params //参数
             block:(BlockType)block; //接收到的数据的处理


+ (void)requestUrl:(NSString *)urlString //url
        httpMethod:(NSString *)method //GET  POST
             block:(BlockType)block; //接收到的数据的处理
@end
