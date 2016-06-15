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

/**
 *  截下载取数据
 *
 *  @param channel    频道
 *  @param ispullup   是否是上拉
 *  @param completion 完成回调
 */
- (void)newsListWithChannel:(NSString *)channel isPullup:(BOOL)start completion:(void(^)(NSArray *array,NSError *error))completion;
@end
