//
//  UINavigationController+MAdd.m
//  Demo_268EDU
//
//  Created by yizhilu on 2017/9/15.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import "UINavigationController+MAdd.h"
#import "UIColor+MAdd.h"
@implementation UINavigationController (MAdd)

-(void)changeTileTextColor:(UIColor *)textColor{
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: textColor}];
}

-(void)changeBackGroundImage:(NSString *)imangeName{
    if (imangeName) {
        [self.navigationBar setBackgroundImage:
         MMIMAGENAMED(imangeName) forBarMetrics:UIBarMetricsDefault];
    }else{
        [self.navigationBar setBackgroundImage:
         [MWhite imageWithColor] forBarMetrics:UIBarMetricsDefault];
    }
}
@end
