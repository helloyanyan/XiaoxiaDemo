//
//  YYDemoViewController.m
//  YYToolDemo
//
//  Created by CityLogistics-PC on 2018/8/4.
//  Copyright © 2018年 XYbaidumap-Demo. All rights reserved.
//

#import "YYDemoViewController.h"
#import "YYDemoView.h"
#import "YYDemoModel.h"
#import "OrderInfoTableViewCell.h"
@interface YYDemoViewController ()<UITableViewDelegate,UITableViewDataSource>
/**
 变量
 */
@property(nonatomic,strong)UITableView *TableView;
@property(nonatomic,strong)NSMutableArray *FirstArray;
@property(nonatomic,strong)NSMutableArray *ChargingArray;

@end

@implementation YYDemoViewController

//只是为了测试是否更改了
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"记录详情";
    self.view.backgroundColor =RGB(240, 240, 240);
    _ChargingArray = [NSMutableArray array];
     _FirstArray = [NSMutableArray array];
    [self CreatInfo];
}

-(void)CreatInfo{
    //    第一个数据
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    dict1[@"time"] = @"爱情终究是经营不来的。我们唯一可以经营的，只有自己；唯一可以做的，是好好经营自己。懂得珍惜和拥抱眼前人，懂得欣赏他对你的好，不要吝啬以微笑来回报他对你的每一个微笑爱情终究是经营不来的。我们唯一可以经营的，只有自己；唯一可以做的，是好好经营自己。懂得珍惜和拥抱眼前人，懂得欣赏他对你的好，不要吝啬以微笑来回报他对你的每一个微笑爱情终究是经营不来的。我们唯一可以经营的，只有自己；唯一可以做的，是好好经营自己。懂得珍惜和拥抱眼前人，懂得欣赏他对你的好，不要吝啬以微笑来回报他对你的每一个微笑";
    dict1[@"detail"] = @"1.0";
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    dict2[@"time"] = @"爱情终究是经营不来的。我们唯一可以经营的，只有自己；唯一可以做的，是好好经营自己。懂得珍惜和拥抱眼前人，懂得欣赏他对你的好，不要吝啬以微笑来回报他对你的每一个微笑爱情终究是经营不来的。我们唯一可以经营的，只有自己；唯一可以做的，是好好经营自己。懂得珍惜和拥抱眼前人，懂得欣赏他对你的好，不要吝啬以微笑来回报他对你的每一个微笑";
    dict2[@"detail"] = @"1.0";
    
    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
    dict3[@"time"] = @"爱情终究是经营不来的。我们唯一可以经营的，只有自己；唯一可以做的，是好好经营自己。懂得珍惜和拥抱眼前人，懂得欣赏他对你的好，不要吝啬以微笑来回报他对你的每一个微笑爱情终究是经营不来的。我们唯一可以经营的，只有自己；唯一可以做的，是好好经营自己。懂得珍惜和拥抱眼前人，懂得欣赏他对你的好，不要吝啬以微笑来回报他对你的每一个微笑";
    dict3[@"detail"] = @"1.0";
    
    NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
    dict4[@"time"] = @"爱情终究是经营不来的。我们唯一可以经营的，只有自己；唯一可以做的，是好好经营自己。懂得珍惜和拥抱眼前人，懂得欣赏他对你的好，不要吝啬以微笑来回报他对你的每一个微笑";
    dict4[@"detail"] =@"1.0";
    
    [_FirstArray addObject:dict1];
    [_FirstArray addObject:dict2];
    [_FirstArray addObject:dict3];
    [_FirstArray addObject:dict3];

    for (NSDictionary *dict in _FirstArray) {
        YYDemoModel *model = [YYDemoModel mj_objectWithKeyValues:dict];
        [_ChargingArray addObject:model];
    }
    self.view.backgroundColor = [UIColor whiteColor];
//    [_TableView reloadData];
     [self CreatView];
}


-(void)CreatView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 110, 150)];
    label.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:label];
    /*
     CGRectGetHeight返回label本身的高度
     CGRectGetMinY返回label顶部的坐标
     CGRectGetMaxY 返回label底部的坐标
     CGRectGetMinX 返回label左边缘的坐标
     CGRectGetMaxX 返回label右边缘的坐标
     CGRectGetMidX表示得到一个frame中心点的X坐标
     CGRectGetMidY表示得到一个frame中心点的Y坐标
     */
    
    NSLog(@"CGRectGetHeight--%f", CGRectGetHeight(label.frame)); //返回uilabel的高度
    NSLog(@"CGRectGetMaxX--%f", CGRectGetMaxX(label.frame)); //返回label右边缘的坐标
    NSLog(@"CGRectGetMaxY--%f", CGRectGetMaxY(label.frame)); //返回label底部的坐标
    NSLog(@"CGRectGetMidX--%f", CGRectGetMidX(label.frame)); //表示得到一个frame中心点的X坐标
    NSLog(@"CGRectGetMidY--%f", CGRectGetMidY(label.frame));//表示得到一个frame中心点的Y坐标
    NSLog(@"CGRectGetMinX--%f", CGRectGetMinX(label.frame));//返回label左边缘的坐标
    NSLog(@"CGRectGetMinY--%f", CGRectGetMinY(label.frame));//返回label顶部的坐标
    
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"有多少%ld",_ChargingArray.count);
    return _ChargingArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderInfoTableViewCell *cell = [[OrderInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    YYDemoModel *model = _ChargingArray[indexPath.row];
    cell.Model = model;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark ===============  尾部视图的高度  ===============
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    [cell setClipsToBounds:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
