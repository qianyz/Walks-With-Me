//
//  DataService.m
//  跟我走
//
//  Created by mac on 15/11/6.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "DataService.h"

@implementation DataService
+ (void)requestUrl:(NSString *)urlString httpMethod:(NSString *)method apiKey:(NSString *)apikey params:(NSMutableDictionary *)params block:(BlockType)block
{
    //0.取得本地保存的token
    
    
    //01 构建url
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    //02 构造request
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:60];
    [request setHTTPMethod:method];
    [request addValue:apikey forHTTPHeaderField:@"apikey"];
    
    //03 拼接参数
    //>>01  name=郭杰&age=9
    
    NSArray *allKeys = [params allKeys];
    NSMutableString   *paramString = [[NSMutableString alloc] init];
    for (int i = 0; i<allKeys.count; i++) {
        
        NSString *key = allKeys[i];
        NSString *value = [params objectForKey:key];
        
        [paramString  appendFormat:@"%@=%@",key,value];
        
        if (i < allKeys.count-1) {
            [paramString appendString:@"&"];
        }
    }
    //>>02 JSON字符串
    //{name:guojie,age:9}
    //JSONKit 转换，目前 jsonkit 已经不更新，丢弃
    
    
    //如果是 GET请求 ，则把参数拼接到url里面
    if ([method isEqualToString:@"GET"]) {
        //query url里面的参数
        NSString *seperation = url.query?@"&":@"?";
        NSString *paraUrlString = [NSString stringWithFormat:@"%@%@%@",urlString,seperation,paramString];
        
        request.URL = [NSURL URLWithString:paraUrlString];
        
    }else if([method isEqualToString:@"POST"]){
        //则把参数放到 body里
        
        NSData *data = [paramString dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:data];
        
    }
    
    //04 connection请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //数据接收完毕 处理数据
        if (connectionError != nil) {
            NSLog(@"网络请求失败 ");
        }
        
        //原生
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        //jsonkit 解析
        //        id result = [data objectFromJSONData];
        
        
        //把数据传递给界面
        if (block) {
            block(result);
        }
        
        
    }];
    
}

+(void)requestUrl:(NSString *)urlString httpMethod:(NSString *)method block:(BlockType)block
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:60];
    [request setHTTPMethod:method];
    
    
    //    NSString *paraUrlString = [NSString stringWithFormat:@"%@%@",urlString,params];
    
    request.URL = [NSURL URLWithString:urlString];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //数据接收完毕 处理数据
        if (connectionError != nil) {
            NSLog(@"网络请求失败 ");
        }
        
        //原生
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        //把数据传递给界面
        if (block) {
            block(result);
        }
        
        
    }];
    
    
}


@end
