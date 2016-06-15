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
        instance = [self new];
    });

    return instance;
}
@end
