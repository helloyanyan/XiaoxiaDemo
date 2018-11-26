//
//  AdjustSize.m
//  ChargingPileApp
//
//  Created by CityLogistics-PC on 2018/6/15.
//  Copyright © 2018年 XYbaidumap-Demo. All rights reserved.
//

#import "AdjustSize.h"

@implementation AdjustSize
//字体大小的自适应
+(CGFloat)adjustFontSize:(CGFloat)fontsize{
    CGFloat newFont;
    if (IS_IPHONE_5){
        newFont = fontsize + IPHONE5_INCREMENT;
    }
    else if (IS_IPHONE_6){
        newFont = fontsize + IPHONE6_INCREMENT;
    }
    else if (IS_IPHONE_6_PLUS){
        newFont = fontsize + IPHONE6PLUS_INCREMENT;
    }
    else{
        newFont = fontsize + IPHONE6_INCREMENT;
    }
    return newFont;
}
@end
