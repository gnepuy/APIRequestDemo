//
//  APIResult.m
//  ApiRequest
//
//  Created by YP on 16/3/9.
//  Copyright © 2016年 yp. All rights reserved.
//

#import "APIResult.h"

@implementation APIResult

- (BOOL)success
{
    return self.status == 0;
}
- (id)initWithDictionary:(NSDictionary *)dic
{
    if (self = [super init]) {
        
        @try {
            if (dic) {
//              取出返回数据的状态码
                self.status = [[dic objectForKey:@"error_code"] intValue];
////              提示信息
                self.message = [dic objectForKey:@"reason"];
 
                NSDictionary *data = [[dic objectForKey:@"result"] objectForKey:@"data"];
////              返回数据
                self.dic = data;
            } else {
//              没有返回数据
                self.message = @"网络错误";
                self.dic = nil;
                self.status = 1;  // 暂时定义无效的网络
            }
        }
        //        接收到异常
        @catch (NSException *exception) {
            self.dic = dic;
            self.status = 0;
        }
        @finally {
            
        }
    }
    return self;
}

@end
