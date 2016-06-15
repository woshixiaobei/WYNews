//
//  WYNewsNormalCell.h
//  WYNews
//
//  Created by 小贝 on 16/6/15.
//  Copyright © 2016年 小贝. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYNewsNormalCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;

@end
