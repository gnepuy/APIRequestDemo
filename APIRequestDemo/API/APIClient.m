//
//  APIClient.m
//  ApiRequest
//
//  Created by YP on 16/3/9.
//  Copyright © 2016年 yp. All rights reserved.
//

#import "APIClient.h"
#import <AFNetworking/AFNetworking.h>

@implementation APIClient
//  采用单例方法创建对象
+ (APIClient *)sharedInstance
{
    static APIClient *apiClient;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        apiClient = [[self alloc] init];
    });
    return apiClient;
}
/** 执行post网络请求 */
+ (void)executePostRequestWithApi:(APIRequest *)api {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    [manager POST:api.fullUrl parameters:api.params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSDictionary *outDic = (NSDictionary *)responseObject;
        [api callBackFinishedWithDictionary:outDic];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [api callBackFailed:error];
    }];
}
/** 执行Get网络请求 */
+ (void)executeGetRequestWithApi:(APIRequest *)api {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];

    [manager GET:api.fullUrl parameters:api.params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *outDic = (NSDictionary *)responseObject;
        [api callBackFinishedWithDictionary:outDic];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [api callBackFailed:error];
    }];
}

//  执行不同的网络请求
+ (void)execute:(APIRequest *)api
{

    switch (api.accessType)
    {
        case kApiAccessPost:
        {
            [APIClient executePostRequestWithApi:api];
            break;
        }
        case kApiAccessGet:
        {
            [APIClient executeGetRequestWithApi:api];
            break;
        }
        default:
            break;
    }
}

@end
