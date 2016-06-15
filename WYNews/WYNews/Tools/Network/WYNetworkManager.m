//
//  WYNetworkManager.m
//  WYNews
//
//  Created by 小贝 on 16/6/15.
//  Copyright © 2016年 小贝. All rights reserved.
//

#import "WYNetworkManager.h"

@implementation WYNetworkManager

+ (instancetype)sharedManager {
    static WYNetworkManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/"];
        instance = [[self alloc]initWithBaseURL:url];
        
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
    });

    return instance;
}

#pragma mark-封装AFN 网络请求
- (void)GETRequest:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(void(^)(id json,NSError *error))completion {

    [self GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@ %@",responseObject,[responseObject class]);
        completion(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"网络请求失败 %@",error);
        completion(nil,error);
    }];
}

#pragma mark-实现网络接口
- (void)newsListWithChannel:(NSString *)channel isPullup:(BOOL)start completion:(void (^)(NSArray *, NSError *))completion {

    NSString *urlStr = [NSString stringWithFormat:@"list/%@/%zd-20.html",channel,start];
    [self GETRequest:urlStr parameters:nil completion:^(id json, NSError *error) {
        
        NSLog(@"%@",json);
        //使用频道作为key获取数组
        NSArray *array = json[channel];
        completion(array,error);
    }];
}
@end
