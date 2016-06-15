//
//  WYNewsListController.m
//  WYNews
//
//  Created by 小贝 on 16/6/15.
//  Copyright © 2016年 小贝. All rights reserved.
//

#import "WYNewsListController.h"
#import "WYNetworkManager.h"
#import "WYNewsListModel.h"

static NSString *cellId = @"cellId";

@interface WYNewsListController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,weak) NSMutableArray <WYNewsListModel *>*newsList;
@end

@implementation WYNewsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[WYNetworkManager sharedManager];
    [self setupUI];
    [self loadData];
}

#pragma mark-加载数据
- (void)loadData {
    
    [[WYNetworkManager sharedManager] newsListWithChannel:@"T1348649079062" isPullup:NO completion:^(NSArray *array, NSError *error) {
        
        NSLog(@"%@",array);
//        NSArray *list = [NSArray yy_modelArrayWithClass:[WYNewsListModel class] json:array];
//        self.newsList = [NSMutableArray arrayWithArray:list];
//        
//        //刷新表格数据
//        [self.tableView reloadData];
        
    }];

}

#pragma mark-UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).description;
    
    return cell;

}
#pragma mark-搭建界面
- (void)setupUI {

    UITableView *tv = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:tv];
    
    //注册可重用标识符
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
    tv.dataSource = self;
    tv.delegate = self;
    
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

    
    //记录成员变量
    _tableView = tv;

}




@end
