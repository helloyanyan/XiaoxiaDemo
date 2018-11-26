//
//  CodeLoginViewController.m
//  ChargingPileApp
//
//  Created by CityLogistics-PC on 2018/6/22.
//  Copyright © 2018年 XYbaidumap-Demo. All rights reserved.
//

#import "CodeLoginViewController.h"
#import "NERegisterViewController.h"

@interface CodeLoginViewController ()<UITextFieldDelegate>
/**
 控件名字自定义
 */
@property(nonatomic,strong)UIButton *ButtonRegister;//注册按钮
@property(nonatomic,strong)UIImageView *ImageViewLogo;//logo图片
@property(nonatomic,strong)UITextField *TextFieldAccount;//用户账号
@property(nonatomic,strong)UILabel *LabelLine1;//第一个线
@property(nonatomic,strong)UITextField *TextFieldCode;//用户密码
@property(nonatomic,strong)UILabel *LabelLine2;//第二个线
@property(nonatomic,strong)UIButton *ButtonGetCode;//忘记密码
@property(nonatomic,strong)UIButton *ButtonLogin;//登录按钮
@property(nonatomic,strong)UIButton *ButtonPassWordLogin;//验证码登录
@property(nonatomic,strong)UIImageView *ImageViewLoginBackground;//用户密码图片
/**
 接口
 */
@end

@implementation CodeLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"验证码登录";
    self.view.backgroundColor = [UIColor whiteColor];
    [self CreatLoginView];
}

#pragma mark ===============  创建登录界面  ===============
-(void)CreatLoginView{
    _ButtonRegister = [UIButton new];
    [_ButtonRegister setTitle:@"注册" forState:UIControlStateNormal];
    _ButtonRegister.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:[AdjustSize adjustFontSize:15]];
    [_ButtonRegister setTitleColor:RGB(89,201,248) forState:UIControlStateNormal];
    [_ButtonRegister addTarget:self action:@selector(ClickEvaluate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_ButtonRegister];
    [_ButtonRegister mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AdaptiveW(24));
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(16));
    }];
    
    //    logo
    _ImageViewLogo = [UIImageView new];
    [self.view addSubview:_ImageViewLogo];
    [_ImageViewLogo setImage:[UIImage imageNamed:@"logo"]];
    _ImageViewLogo.backgroundColor = [UIColor clearColor];
    _ImageViewLogo.contentMode = UIViewContentModeScaleAspectFit;
    [_ImageViewLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_ButtonRegister.mas_bottom).offset(AdaptiveW(23));
        make.height.mas_equalTo(AdaptiveW(85));
        make.width.mas_equalTo(AdaptiveW(75));
        make.centerX.mas_equalTo(self.view);
    }];

    _TextFieldAccount = [UITextField new];
    [_TextFieldAccount setPlaceholder:@"请输入手机号"];
    [_TextFieldAccount setValue: [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]] forKeyPath:@"_placeholderLabel.font"];
    [_TextFieldAccount setValue:RGB(223, 223, 223) forKeyPath:@"_placeholderLabel.textColor"];
    _TextFieldAccount.clearButtonMode = UITextFieldViewModeWhileEditing;
    _TextFieldAccount.delegate = self;
    _TextFieldAccount.font = [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]];
    _TextFieldAccount.textColor =RGB(33, 31, 30);
    _TextFieldAccount.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_TextFieldAccount];
    [_TextFieldAccount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_ImageViewLogo.mas_bottom).offset(AdaptiveW(36));
        make.left.mas_equalTo(self.view).offset(AdaptiveW(16));
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(20));
    }];

    _LabelLine1 = [UILabel new];
    _LabelLine1.backgroundColor = RGB(222, 222, 222);
    [self.view addSubview:_LabelLine1];
    [_LabelLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptiveW(15));
        make.top.mas_equalTo(_TextFieldAccount.mas_bottom).offset(AdaptiveW(15));
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(16));
    }];

    _TextFieldCode = [UITextField new];
    [_TextFieldCode setPlaceholder:@"请输入验证码"];
    [_TextFieldCode setValue: [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]] forKeyPath:@"_placeholderLabel.font"];
    [_TextFieldCode setValue:RGB(223, 223, 223) forKeyPath:@"_placeholderLabel.textColor"];
    _TextFieldCode.clearButtonMode = UITextFieldViewModeWhileEditing;
    _TextFieldCode.delegate = self;
    _TextFieldCode.font = [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]];
    _TextFieldCode.textColor =RGB(33, 31, 30);
    _TextFieldCode.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_TextFieldCode];
    [_TextFieldCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_LabelLine1.mas_bottom).offset(AdaptiveW(14));
        make.left.mas_equalTo(self.view).offset(AdaptiveW(15));
        make.width.mas_equalTo(AdaptiveW(230));
    }];

    _ButtonGetCode = [UIButton new];
    [_ButtonGetCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    _ButtonGetCode.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]];
    [_ButtonGetCode setTitleColor:RGB(89,201,248) forState:UIControlStateNormal];
    [_ButtonGetCode addTarget:self action:@selector(ClickEvaluate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_ButtonGetCode];
    [_ButtonGetCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_LabelLine1.mas_bottom).offset(AdaptiveW(2));
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(12));
        make.height.mas_equalTo(AdaptiveW(45));
    }];

    _LabelLine2 = [UILabel new];
    _LabelLine2.backgroundColor = RGB(222, 222, 222);
    [self.view addSubview:_LabelLine2];
    [_LabelLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptiveW(15));
        make.top.mas_equalTo(_TextFieldCode.mas_bottom).offset(AdaptiveW(14));
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(16));
    }];



    _ButtonLogin = [UIButton new];
    [_ButtonLogin setTitle:@"登录" forState:UIControlStateNormal];
    _ButtonLogin.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:[AdjustSize adjustFontSize:15]];
    [_ButtonLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_ButtonLogin addTarget:self action:@selector(ClickPay:) forControlEvents:UIControlEventTouchUpInside];
    [_ButtonLogin setBackgroundImage:[UIImage imageNamed:@"底部按钮-选中"] forState:UIControlStateNormal];
    [self.view addSubview:_ButtonLogin];
    [_ButtonLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(_LabelLine2.mas_bottom).offset(AdaptiveW(32));
        make.width.mas_equalTo(AdaptiveW(345));
        make.height.mas_equalTo(AdaptiveW(44));
    }];

    _ButtonPassWordLogin = [UIButton new];
    [_ButtonPassWordLogin setTitle:@"密码登录" forState:UIControlStateNormal];
    _ButtonPassWordLogin.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]];
    [_ButtonPassWordLogin setTitleColor:RGB(89,201,248) forState:UIControlStateNormal];
    [_ButtonPassWordLogin addTarget:self action:@selector(ClickEvaluate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_ButtonPassWordLogin];
    [_ButtonPassWordLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_ButtonLogin.mas_bottom).offset(AdaptiveW(9));
        make.centerX.mas_equalTo(self.view);
    }];

    _ImageViewLoginBackground = [UIImageView new];
    [self.view addSubview:_ImageViewLoginBackground];
    [_ImageViewLoginBackground setImage:[UIImage imageNamed:@"Group 8"]];
    //    _ImageViewLoginBackground.contentMode = UIViewContentModeScaleAspectFit;
    [_ImageViewLoginBackground mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).offset(-AdaptiveW(10));
        make.left.mas_equalTo(self.view).offset(AdaptiveW(6));
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(6));
        //    make.height.mas_equalTo(AdaptiveW(160));
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
