//
//  APIRequest.h
//  ApiRequest
//
//  Created by YP on 16/3/9.
//  Copyright © 2016年 yp. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "APIResult.h"

@class APIRequest;

//  默认的网络请求的延时时间
#define defaultAPIRequestTimeOutSeconds     15

//  错误类型枚举暂未收集

typedef enum ApiAccessType {
    kApiAccessGet,                      // Get方式
    kApiAccessPost,                     // Post方式
    kApiAccessUpload,                   // 上传
    kApiAccessMultiUpload              // 多张图片上传
}ApiAccessType;

// 没有进行验证的这个步骤 属性可以不写了
typedef enum ApiResultFormat {
    kApiResultJson,                     // Json格式
    kApiResultXml,                      // Xml格式
}ApiResultFormat;

@protocol APIRequestDelegate <NSObject>

@optional

- (void)serverApi_FinishedSuccessed:(APIRequest *)api result:(APIResult *)sr;
- (void)serverApi_RequestFailed:(APIRequest *)api error:(NSError *)error;
- (void)serverApi_FinishedFailed:(APIRequest *)api result:(APIResult *)sr;

@end
@interface APIRequest : NSObject

#pragma mark - 基本属性

/** 请求类型 */
@property (nonatomic, readonly) ApiAccessType accessType;
/** 请求返回的格式 */
@property (nonatomic, readonly) ApiResultFormat resultFormat;
/** 请求超时时间 */
@property (nonatomic, readonly) NSTimeInterval timeout;
/** 服务器地址 */
@property (nonatomic, readonly) NSString *serviceUrl;
/** 排序 */
@property (nonatomic, readonly) NSString *sort;
/** 分页大小 */
@property (nonatomic, readonly) NSString *pagesize;
/** 应用Key */
@property (nonatomic, readonly) NSString *key;
/** 第几页 */
@property (nonatomic, readonly) NSString *page;
/** 时间戳 */
@property (nonatomic, readonly) NSString *time;
/** 请求路径 */
@property (nonatomic, readonly) NSString *fullUrl;
/** 代理 */
@property (nonatomic, weak) id<APIRequestDelegate> delegate;
/** 请求参数数组 */
@property (nonatomic, strong) NSMutableArray *params;

#pragma mark - 基本方法
- (id)initWithDelegate:(id<APIRequestDelegate>)delegate;
/**
 *  拼接公共参数
 */
- (void)appendBaseParams;

#pragma mark - APIRequestDelegate回调方法
/**
 *  返回数据调用方法
 */
- (void)callBackFinishedWithDictionary:(NSDictionary *)dic;
/**
 *  返回数据错误
 */
- (void)callBackFailed:(NSError *)error;

@end





