//
//  APIClient.h
//  ApiRequest
//
//  Created by YP on 16/3/9.
//  Copyright © 2016年 yp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIRequest.h"

@interface APIClient : NSObject

/**
 *  APIClient 初始化
 */
+ (APIClient *)sharedInstance;
/**
 *  执行不同网络请求
 */
+ (void)execute:(APIRequest *)api;

@end
