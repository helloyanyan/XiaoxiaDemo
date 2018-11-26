//
//  NENavigationController.h
//  ChargingPileApp
//
//  Created by CityLogistics-PC on 2018/6/14.
//  Copyright © 2018年 XYbaidumap-Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NENavigationController : UINavigationController
/**
 全屏滑动返回手势
 */
@property (nonatomic, strong) UIPanGestureRecognizer *pan;
@property (strong, nonatomic) UIColor * barBackgroundColor;
-(id)naviPresentedViewController;
@end
