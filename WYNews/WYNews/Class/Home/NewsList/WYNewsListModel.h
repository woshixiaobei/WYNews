//
//  WYNewsListModel.h
//  WYNews
//
//  Created by 小贝 on 16/6/15.
//  Copyright © 2016年 小贝. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYNewsListModel : NSObject
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  摘要
 */
@property (nonatomic, copy) NSString *digest;
/**
 *  图像URL来源
 */
@property (nonatomic, copy) NSString *imagsrc;
/**
 *  来源
 */
@property (nonatomic, copy) NSString *source;
/**
 *  跟帖数量
 */
@property (nonatomic, assign) NSInteger replyCount;
/**
 *  多图新闻的其余多个图片
 */
@property (nonatomic, strong) NSArray *imagextra;

@end
