//
//  WYNetworkManager.h
//  WYNews
//
//  Created by 小贝 on 16/6/15.
//  Copyright © 2016年 小贝. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface WYNetworkManager : AFHTTPSessionManager

+ (instancetype)sharedManager;
@end
