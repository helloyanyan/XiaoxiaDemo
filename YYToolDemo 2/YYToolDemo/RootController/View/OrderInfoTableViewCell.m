//
//  OrderInfoTableViewCell.m
//  YYToolDemo
//
//  Created by CityLogistics-PC on 2018/8/6.
//  Copyright © 2018年 XYbaidumap-Demo. All rights reserved.
//

#import "OrderInfoTableViewCell.h"

@implementation OrderInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{ self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _LabelDetail = [[UILabel alloc] init];
        _LabelDetail.textColor = RGB(187,187,187);
        _LabelDetail.font = [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]];
        [self.contentView addSubview:_LabelDetail];
        [_LabelDetail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView ).offset(AdaptiveW(16));
            make.top.mas_equalTo(self.contentView).offset(AdaptiveW(12));
        }];
        
        _LabelTime = [[UILabel alloc] init];
        _LabelTime.textColor = RGB(102,102,102);
        _LabelTime.font = [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]];
        [self.contentView addSubview:_LabelTime];
        [_LabelTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView).offset(-AdaptiveW(14));
            make.top.mas_equalTo(self.contentView).offset(AdaptiveW(11.5));
        }];
    }
    return self;
}


-(void)setModel:(YYDemoModel *)Model{
    _LabelDetail.text = [NSString stringWithFormat:@"%@",Model.detail];
    _LabelTime.text = [NSString stringWithFormat:@"%@",Model.time];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
