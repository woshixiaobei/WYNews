//
//  AppDelegate.m
//  WYNews
//
//  Created by 小贝 on 16/6/15.
//  Copyright © 2016年 小贝. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setUpAppearence];
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    Class cls = NSClassFromString(@"WYNewsListController");
    UIViewController *vc = [cls new];
    
    _window.rootViewController = vc;
    [_window makeKeyAndVisible];
    
    return YES;
}

- (void)setUpAppearence {

    //设置tabBar的渲染颜色-会设置[后续外观]UItabBar的titColor的全部指定颜色
    [UITabBar appearance].tintColor = [UIColor cz_colorWithHex:0xDF0000];

}

@end
