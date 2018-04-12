//
//  APIRequest.m
//  ApiRequest
//
//  Created by YP on 16/3/9.
//  Copyright © 2016年 yp. All rights reserved.
//

#import "APIRequest.h"

@implementation APIRequest

//  初始化
- (id)initWithDelegate:(id<APIRequestDelegate>)delegate
{
    if (self = [self init]) {
        
        self.params = [NSMutableArray array];
        self.delegate = delegate;
//        [self appendBaseParams];  暂时不需要拼接公共参数
    }
    return self;
}


// 默认的是Get方式进行访问
- (ApiAccessType)accessType
{
    return kApiAccessGet;
}

// 默认的超时时间
- (NSTimeInterval)timeout
{
    return defaultAPIRequestTimeOutSeconds;
}
//  默认服务器地址
- (NSString *)serviceUrl
{
    return @"http://japi.juhe.cn/joke/content/list.from";
}
/** 排序 */
- (NSString *)sort
{
    return @"asc";
}
//  默认服务器地址
- (NSString *)pagesize
{
    return @"20";
}
/** 应用Key */
- (NSString *)key
{
    return @"dfde3a6b1deb65a049c8d0570f320458";
}
/** 第几页 */
- (NSString *)page
{
    return @"1";
}
/** 时间戳 */
- (NSString *)time
{
    return @"1418745237";
}
/** 拼接的请求地址 */

//
- (NSString *)fullUrl
{
//   服务器地址 和 接口名
    NSString *url = [NSString stringWithFormat:@"%@?key=%@&page=%@&pagesize=%@&sort=%@&time=%@", self.serviceUrl, self.key, self.page, self.pagesize, self.sort, self.time];
    return url;
}
//   数据请求完成的 回调
- (void)callBackFinishedWithDictionary:(NSDictionary *)dic
{
//  处理 responseObject
    APIResult *sr = [[APIResult alloc] initWithDictionary:dic];
//  error ID = 0
    if (sr.success) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(serverApi_FinishedSuccessed:result:)]) {
            //
            [self.delegate serverApi_FinishedSuccessed:self result:sr];
        }
//  error ID = 1
    } else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(serverApi_FinishedFailed:result:)]) {
            [self.delegate serverApi_FinishedFailed:self result:sr];
        }
    }
}
// 数据请求失败的回调
- (void)callBackFailed:(NSError *)error
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(serverApi_RequestFailed:error:)]) {
        [self.delegate serverApi_RequestFailed:self error:error];
    }
}

//  拼接的基本参数
- (void)appendBaseParams
{
    
}
@end
