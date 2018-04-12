//
//  ViewController.m
//  APIRequestDemo
//
//  Created by yp on 2018/4/12.
//  Copyright © 2018年 yp. All rights reserved.
//

#import "ViewController.h"
#import "APIClient.h"
#import "APIRequest.h"
#import "APIResult.h"
#import "ApiRequestGetInfo.h"

@interface ViewController ()<APIRequestDelegate>

@property (nonatomic, strong) ApiRequestGetInfo *apiGetInfo;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [APIClient execute:self.apiGetInfo];
}

#pragma mark - ApiRequest delegate
- (void)serverApi_FinishedSuccessed:(APIRequest *)api result:(APIResult *)sr
{
    if (api == self.apiGetInfo) {
        //  sr.dic 就是 字典的 result字典 进行数据处理就好了
        NSLog(@"%@", sr.dic);
    }
}
- (void)serverApi_FinishedFailed:(APIRequest *)api result:(APIResult *)sr
{
    if (api == self.apiGetInfo) {
        //  sr.message  接口错误提示信息
    }
}
- (void)serverApi_RequestFailed:(APIRequest *)api error:(NSError *)error
{
    if (api == self.apiGetInfo) {
        //  错误描述  error.locationdecription
    }
    
}

- (ApiRequestGetInfo *)apiGetInfo
{
    if (_apiGetInfo == nil) {
        
        _apiGetInfo = [[ApiRequestGetInfo alloc] initWithDelegate:self];
    }
    return _apiGetInfo;
}

@end
