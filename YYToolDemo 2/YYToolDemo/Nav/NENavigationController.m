//
//  NENavigationController.m
//  ChargingPileApp
//
//  Created by CityLogistics-PC on 2018/6/14.
//  Copyright © 2018年 XYbaidumap-Demo. All rights reserved.
//

#import "NENavigationController.h"
#import "UIBarButtonItem+MAdd.h"
#import "UIColor+MAdd.h"

@interface NENavigationController ()<UIGestureRecognizerDelegate>
#define MWhite [UIColor whiteColor]
@end

@implementation NENavigationController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate =  self;
    self.navigationBar.barStyle = UIBarStyleBlack;
    // 去掉导航栏底部的线
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    //渐变
    [self.navigationBar.layer insertSublayer:[self gradientLayer] atIndex:0];
    
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
}

- (CAGradientLayer *)gradientLayer {
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc]init];
    // CGColor是无法放入数组中的，必须要转型。
    gradientLayer.colors = @[
                             (__bridge id)[UIColor colorWithRed:95/ 255.0 green:201/ 255.0 blue:246/ 255.0 alpha:1.0].CGColor,
                             (__bridge id)[UIColor colorWithRed:91 / 255.0 green:234 / 255.0 blue:202 / 255.0 alpha:1.0].CGColor,
                             ];
    // 颜色分割线
    gradientLayer.locations = @[@0, @1];
    // 颜色渐变的起点和终点，范围为 (0~1.0, 0~1.0)
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, -20, self.navigationBar.bounds.size.width, 20 + self.navigationBar.bounds.size.height);
    return gradientLayer;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count <= 1 ) {
        return NO;
    }
    return YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.navigationBar.translucent = YES;
    viewController.automaticallyAdjustsScrollViewInsets = NO;
    ///push 出来的控制器不是第一层的子控制器
    if (self.viewControllers.count > 0){
        ///当push 出页面时，隐藏导航栏按钮
        viewController.hidesBottomBarWhenPushed = NO;
        ///设置导航栏左侧按钮
        viewController.navigationItem.hidesBackButton = NO;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(moreBtnClick) normalImage:@"定位" highlightImage:@"定位"];
    }
    if (![[super topViewController] isKindOfClass:[viewController class]]) {
        ///如果和上一个控制器一样，隔绝此操作
        [super pushViewController:viewController animated:animated];
    }
}

- (void)moreBtnClick{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

