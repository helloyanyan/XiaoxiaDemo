//
//  UINavigationController+MAdd.h
//  Demo_268EDU
//
//  Created by yizhilu on 2017/9/15.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (MAdd)

/**
 改变当前导航栏字体的颜色

 @param textColor  导航字体色值
 */
-(void)changeTileTextColor:(UIColor *)textColor;

/**
 改变当前导航栏背景颜色

 @param imangeName 图片的名字,传空为白色
 */
-(void)changeBackGroundImage:(NSString *)imangeName;

@end
