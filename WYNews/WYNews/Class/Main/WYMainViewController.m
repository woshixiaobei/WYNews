//
//  WYMainViewController.m
//  WYNews
//
//  Created by 小贝 on 16/6/15.
//  Copyright © 2016年 小贝. All rights reserved.
//

#import "WYMainViewController.h"

@interface WYMainViewController ()

@end

@implementation WYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllers];
}

#pragma mark-添加子控制器
- (void)addChildViewControllers {
    
    NSArray *array = @[
                       @{@"clsName":@"UIViewController",@"title":@"首页",@"imageName":@"tabbar_icon_bar_normal"},
                       @{@"clsName":@"UIViewController",@"title":@"阅读",@"imageName":@"tabbar_icon_bar_normal"},
                       @{@"clsName":@"UIViewController",@"title":@"视频",@"imageName":@"tabbar_icon_bar_normal"},
                       @{@"clsName":@"UIViewController",@"title":@"话题",@"imageName":@"tabbar_icon_bar_normal"},
                       @{@"clsName":@"UIViewController",@"title":@"我",@"imageName":@"tabbar_icon_bar_normal"}
                       ];
    NSMutableArray *arrayM = [NSMutableArray array];
    for ( NSDictionary *dict in array) {
        
        [arrayM addObject:[self childViewControllerWithDict:dict]];
    }
    
    //设置子控制器的数组
    self.viewControllers = arrayM.copy;
}

/**
 *  创建一个子控制器
 */
- (UIViewController *)childViewControllerWithDict:(NSDictionary *)dict {
    
    //1.创建控制器
    NSString *clsName = dict[@"clsName"];
    Class cls = NSClassFromString(clsName);
    
    NSAssert(cls != nil, @"传入了类名错误");
    UIViewController *vc = [cls new];
    
    vc.title = dict[@"title"];

    NSString *imageName = dict[@"imageName"];
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    return nav;
    
}

@end
