//
//  ApiRequestGetInfo.m
//  APIRequestDemo
//
//  Created by yp on 2017/2/23.
//  Copyright © 2017年 shinow. All rights reserved.
//

#import "ApiRequestGetInfo.h"

@implementation ApiRequestGetInfo

/** 排序 */
- (NSString *)sort
{
    return @"asc";
}
//  默认服务器地址
- (NSString *)pagesize
{
    return @"10";
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

@end
