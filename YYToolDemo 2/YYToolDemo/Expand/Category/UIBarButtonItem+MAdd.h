//
//  UIBarButtonItem+MAdd.h
//  Demo_268EDU
//
//  Created by yizhilu on 2017/9/4.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MAdd)

/**
 快速创建ButtonItem

 @param target 目标
 @param action 事件
 @param image 正常图片
 @param highImage 高亮图片
 @return UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target
                             action:(SEL)action
                              normalImage:(NSString *)image
                          highlightImage:(NSString *)highImage;

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage title:(NSString *)title TitleColor:(UIColor *)color;

@end
