//
//  UIButton+Item.m
//  TJBudeJie
//
//  Created by TJ on 16/5/29.
//  Copyright © 2016年 TJCoder. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)

// 高亮状态
+ (instancetype)itemWithImage:(NSString *)img highlightImg:(NSString *)highlightImg target:(id)target action:(SEL)action {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:img];
    UIImage *hightImage = [UIImage imageNamed:highlightImg];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:hightImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *contentView = [[UIView alloc] initWithFrame:btn.bounds];
    [contentView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:contentView];
}

// 选中状态
+ (instancetype)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage target:(id)target action:(SEL)action {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn sizeToFit];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *contentView = [[UIView alloc] initWithFrame:btn.bounds];
    [contentView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:contentView];
}

// 高亮状态+Title
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image hightImage:(UIImage *)hightImage target:(id)target action:(SEL)action {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:hightImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *contentView = [[UIView alloc] initWithFrame:btn.bounds];
    [contentView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:contentView];
}

// 选中状态+Title
+ (instancetype)itemWithTitle:(NSString *)title Image:(UIImage *)image selectImage:(UIImage *)selectImage target:(id)target action:(SEL)action {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectImage forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIView *contentView = [[UIView alloc] initWithFrame:btn.bounds];
    [contentView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:contentView];
}
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
    
    btn.titleLabel.font =[UIFont systemFontOfSize:[AdjustSize adjustFontSize:15]];
//    CGSize size = [title sizeForFont:MFONT_15 size:CGSizeMake(MAXFLOAT, MAXFLOAT) mode:NSLineBreakByWordWrapping];
//    btn.size = size;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}


@end
