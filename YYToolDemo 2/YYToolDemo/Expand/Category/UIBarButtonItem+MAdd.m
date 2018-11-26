//
//  UIBarButtonItem+MAdd.m
//  Demo_268EDU
//
//  Created by yizhilu on 2017/9/4.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import "UIBarButtonItem+MAdd.h"

@implementation UIBarButtonItem (MAdd)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action normalImage:(NSString *)image highlightImage:(NSString *)highImage{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (image) {
        [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (highImage) {
        [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    }
    // 设置尺寸
   CGSize size = btn.currentBackgroundImage.size;
    btn.size = size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage title:(NSString *)title TitleColor:(UIColor *)color
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if (image) {
        [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (highImage) {
        [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    }
    // 设置尺寸
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:color forState:(UIControlStateNormal)];
    
//    btn.titleLabel.font = MFONT_15;
//    CGSize size = [title sizeForFont:MFONT_15 size:CGSizeMake(MAXFLOAT, MAXFLOAT) mode:NSLineBreakByWordWrapping];
//    btn.size = size;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

@end
