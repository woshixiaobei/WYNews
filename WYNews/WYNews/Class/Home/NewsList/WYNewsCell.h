//
//  WYNewsCell.h
//  WYNews
//
//  Created by 小贝 on 16/6/16.
//  Copyright © 2016年 小贝. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYNewsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *replyLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *extralView;


@end
