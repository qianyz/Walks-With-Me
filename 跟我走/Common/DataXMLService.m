//
//  DataXMLService.m
//  跟我走
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "DataXMLService.h"
#define kHostUrl @"http://travel.fengjing.com/HolidaySvc.asmx"
#import "GDataXMLNode.h"
@implementation DataXMLService

+(void)requestUrl:(NSString *)urlString block:(BlockType)block
{
    NSURL *url = [NSURL URLWithString:kHostUrl];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    
    NSString *XMLStr =urlString;
    // 设置请求头
    [request setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    
    // NSString --> NSData
    request.HTTPBody = [XMLStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // XML解析
        GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:data error:nil];
        
        // 获取文档的根节点
        GDataXMLElement *sourceElement = document.rootElement;
        
        // 获取soap:Body节点信息
        NSArray *arr1 = [sourceElement elementsForName:@"soap:Body"];
        GDataXMLElement *requestServiceDataResponse = [arr1 firstObject];
        
        // 获取RequestServiceDataResponse节点信息
        NSArray *arr2 = [requestServiceDataResponse elementsForName:@"RequestServiceDataResponse"];
        GDataXMLElement *RequestServiceDataResult = [arr2 firstObject];
        
        // 获取RequestServiceDataResult节点信息
        NSArray *arr3 = [RequestServiceDataResult elementsForName:@"RequestServiceDataResult"];
        GDataXMLElement *result = [arr3 firstObject];
        
        // 数据解析成字典
        NSData *jsonData = [result.stringValue dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        id dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        
        if (block) {
            block(dic);
        }
        
    }];


    
}

@end
