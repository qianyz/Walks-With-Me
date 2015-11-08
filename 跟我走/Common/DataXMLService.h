//
//  DataXMLService.h
//  跟我走
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataXMLService : NSObject
typedef void(^BlockType)(id result);


+(void)requestUrl:(NSString *)urlString //url
            block:(BlockType)block;

@end
