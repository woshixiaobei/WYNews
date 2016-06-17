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
#import <UIImageView+WebCache.h>
#import "WYNewsCell.h"

static NSString *normalCellId = @"normalCellId";
static NSString *extralCellId = @"extralCellId";
@interface WYNewsListController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray <WYNewsListModel *>*newsList;
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
        
       // NSLog(@"%@",array);
        //字典的数组 - 字典转模型
        NSArray *list = [NSArray yy_modelArrayWithClass:[WYNewsListModel class] json:array];
        self.newsList = [NSMutableArray arrayWithArray:list];
        
        //刷新表格数据
        [self.tableView reloadData];
        
    }];

}

#pragma mark-UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _newsList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    WYNewsListModel *model = _newsList[indexPath.row];
    
   // NSString *cellId = (model.imgextra.count > 0) ? normalCellId : extralCellId;
    
    NSString *cellId;
    if (model.imgextra.count > 0) {
        cellId = extralCellId;
    }else {
        cellId = normalCellId;
    
    }
    WYNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    cell.titleLabel.text = model.title;
    cell.sourceLabel.text = model.source;
    cell.replyLabel.text = @(model.replyCount).description;
    
    NSURL *url = [NSURL URLWithString:model.imgsrc];
    [cell.iconView sd_setImageWithURL:url];
    
    //设置多图 - 如果没有不会进入循环
    NSInteger index = 0;
    for (NSDictionary *dict in model.imgextra) {
        NSURL *url = [NSURL URLWithString:dict[@"imgsrc"]];
        [cell.extralView[index] sd_setImageWithURL:url];
        index ++;
    }
    return cell;

}
#pragma mark-搭建界面
- (void)setupUI {

    UITableView *tv = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:tv];
    
    //注册可重用标识符
    [tv registerNib:[UINib nibWithNibName:@"WYNewsNormalCell" bundle:nil] forCellReuseIdentifier:normalCellId];
    [tv registerNib:[UINib nibWithNibName:@"WYNewsExtalCell" bundle:nil] forCellReuseIdentifier:extralCellId];
    
    tv.dataSource = self;
    tv.delegate = self;
    
    //自动行高设定
    tv.rowHeight = UITableViewAutomaticDimension;
    tv.estimatedRowHeight = 120;
    
    
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

    
    //记录成员变量
    _tableView = tv;

}
@end
