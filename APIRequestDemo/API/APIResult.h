//
//  APIResult.h
//  ApiRequest
//
//  Created by YP on 16/3/9.
//  Copyright © 2016年 yp. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface APIResult : NSObject

/** 提示信息 */
@property (nonatomic, copy) NSString *message;
/** 请求状态 */
@property (nonatomic, assign) NSInteger status;
/** 请求是否成功 */
@property (nonatomic, readonly) BOOL success;
/** 接收数据的字典  */
@property (nonatomic, strong) NSDictionary *dic;
/** 字典处理 */
- (id)initWithDictionary:(NSDictionary *)dic;

@end
