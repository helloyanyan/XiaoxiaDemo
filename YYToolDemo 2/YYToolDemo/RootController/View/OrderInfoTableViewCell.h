//
//  OrderInfoTableViewCell.h
//  YYToolDemo
//
//  Created by CityLogistics-PC on 2018/8/6.
//  Copyright © 2018年 XYbaidumap-Demo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYDemoModel.h"
@interface OrderInfoTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *LabelDetail;
@property(nonatomic,strong)UILabel *LabelTime;
@property(nonatomic,strong)YYDemoModel *Model;
@end
