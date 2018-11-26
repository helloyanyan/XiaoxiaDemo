//
//  NERegisterViewController.m
//  ChargingPileApp
//
//  Created by CityLogistics-PC on 2018/6/14.
//  Copyright © 2018年 XYbaidumap-Demo. All rights reserved.
//

#import "NERegisterViewController.h"


@interface NERegisterViewController ()<UITextFieldDelegate>
/**
 自定义变量
 */
@property(nonatomic,strong)UILabel *LabelRegister; //注册
@property(nonatomic,strong)UIImageView *ImageViewError;//返回
@property(nonatomic,strong)UITextField *TextFieldName;//姓名
@property(nonatomic,strong)UILabel *LabelLine1;//线1
@property(nonatomic,strong)UITextField *TextFieldPhone;//手机号
@property(nonatomic,strong)UILabel *LabelLine2;//线2
@property(nonatomic,strong)UITextField *TextFieldPassWord;//密码
@property(nonatomic,strong)UILabel *LabelLine3;//线3
@property(nonatomic,strong)UITextField *TextFieldSecondPassWord;//二次密码
@property(nonatomic,strong)UILabel *LabelLine4;//线4
@property(nonatomic,strong)UITextField *TextFieldVerificationCode;//验证码
@property(nonatomic,strong)UILabel *LabelLine5;//线5
@property(nonatomic,strong)UIButton *ButtonGetCode;//获取验证码
@property(nonatomic,strong)UIButton *ButtonConfirm;//确定
/**
 接口
 */

@end

@implementation NERegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"注册";
    self.view.backgroundColor = RGB(240, 240, 240);
    //  创建注册界面
    [self CreatRegisterView];
}

-(void)CreatRegisterView{
    _LabelRegister = [[UILabel alloc]init];
    _LabelRegister = [[UILabel alloc]init];
    _LabelRegister.text = @"注册";
    _LabelRegister.textColor = RGB(33,31,30);
    _LabelRegister.font =  [UIFont fontWithName:@"PingFangSC-Medium" size:[AdjustSize adjustFontSize:29]];
    [self.view addSubview:_LabelRegister];
    [_LabelRegister mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptiveW(16));
        make.top.mas_equalTo(self.view).offset(AdaptiveW(30)+64);
    }];
    
    _ImageViewError = [[UIImageView alloc]init];
    _ImageViewError.userInteractionEnabled = YES;
    _ImageViewError.contentMode =UIViewContentModeScaleAspectFit;
    _ImageViewError.image = [UIImage imageNamed:@"关闭"];
    [self.view addSubview:_ImageViewError];
    [_ImageViewError mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AdaptiveW(30)+64);
        make.width.mas_equalTo(AdaptiveW(17));
        make.height.mas_equalTo(AdaptiveW(16));
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(12));
    }];
    
    _TextFieldName = [UITextField new];
    [_TextFieldName setPlaceholder:@"请输入真实姓名"];
    [_TextFieldName setValue: [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]] forKeyPath:@"_placeholderLabel.font"];
    [_TextFieldName setValue:RGB(223, 223, 223) forKeyPath:@"_placeholderLabel.textColor"];
    _TextFieldName.clearButtonMode = UITextFieldViewModeWhileEditing;
    _TextFieldName.delegate = self;
    _TextFieldName.font = [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]];
    _TextFieldName.textColor =RGB(33, 31, 30);
    _TextFieldName.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_TextFieldName];
    [_TextFieldName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.LabelRegister.mas_bottom).offset(AdaptiveW(34));
        make.left.mas_equalTo(self.view).offset(AdaptiveW(16));
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(20));
    }];
    
    _LabelLine1 = [UILabel new];
    _LabelLine1.backgroundColor = RGB(222, 222, 222);
    [self.view addSubview:_LabelLine1];
    [_LabelLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptiveW(16));
        make.top.mas_equalTo(self.TextFieldName.mas_bottom).offset(AdaptiveW(21));
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(15));
    }];

    _TextFieldPhone = [UITextField new];
    [_TextFieldPhone setPlaceholder:@"请输入手机号码"];
    [_TextFieldPhone setValue: [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]] forKeyPath:@"_placeholderLabel.font"];
    [_TextFieldPhone setValue:RGB(223, 223, 223) forKeyPath:@"_placeholderLabel.textColor"];
    _TextFieldPhone.clearButtonMode = UITextFieldViewModeWhileEditing;
    _TextFieldPhone.delegate = self;
    _TextFieldPhone.font = [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]];
    _TextFieldPhone.textColor =RGB(33, 31, 30);
    _TextFieldPhone.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_TextFieldPhone];
    [_TextFieldPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_LabelLine1.mas_bottom).offset(AdaptiveW(23));
        make.left.mas_equalTo(self.view).offset(AdaptiveW(16));
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(20));
    }];
    
    _LabelLine2 = [UILabel new];
    _LabelLine2.backgroundColor = RGB(222, 222, 222);
    [self.view addSubview:_LabelLine2];
    [_LabelLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptiveW(16));
        make.top.mas_equalTo(_TextFieldPhone.mas_bottom).offset(AdaptiveW(21));
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(15));
    }];
    
    _TextFieldPassWord = [UITextField new];
    [_TextFieldPassWord setPlaceholder:@"请输入密码"];
    _TextFieldPassWord.secureTextEntry = YES;
    [_TextFieldPassWord setValue: [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]] forKeyPath:@"_placeholderLabel.font"];
    [_TextFieldPassWord setValue:RGB(223, 223, 223) forKeyPath:@"_placeholderLabel.textColor"];
    _TextFieldPassWord.clearButtonMode = UITextFieldViewModeWhileEditing;
    _TextFieldPassWord.delegate = self;
    _TextFieldPassWord.font = [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]];
    _TextFieldPassWord.textColor =RGB(33, 31, 30);
    _TextFieldPassWord.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_TextFieldPassWord];
    [_TextFieldPassWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_LabelLine2.mas_bottom).offset(AdaptiveW(23));
        make.left.mas_equalTo(self.view).offset(AdaptiveW(16));
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(20));
    }];
    
    _LabelLine3 = [UILabel new];
    _LabelLine3.backgroundColor = RGB(222, 222, 222);
    [self.view addSubview:_LabelLine3];
    [_LabelLine3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptiveW(16));
        make.top.mas_equalTo(_TextFieldPassWord.mas_bottom).offset(AdaptiveW(21));
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(15));
    }];
    
    _TextFieldSecondPassWord = [UITextField new];
    [_TextFieldSecondPassWord setPlaceholder:@"确认密码"];
    _TextFieldSecondPassWord.secureTextEntry = YES;
    [_TextFieldSecondPassWord setValue: [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]] forKeyPath:@"_placeholderLabel.font"];
    [_TextFieldSecondPassWord setValue:RGB(223, 223, 223) forKeyPath:@"_placeholderLabel.textColor"];
    _TextFieldSecondPassWord.clearButtonMode = UITextFieldViewModeWhileEditing;
    _TextFieldSecondPassWord.delegate = self;
    _TextFieldSecondPassWord.font = [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]];
    _TextFieldSecondPassWord.textColor =RGB(33, 31, 30);
    _TextFieldSecondPassWord.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_TextFieldSecondPassWord];
    [_TextFieldSecondPassWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_LabelLine3.mas_bottom).offset(AdaptiveW(23));
        make.left.mas_equalTo(self.view).offset(AdaptiveW(16));
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(20));
    }];
    
    _LabelLine4 = [UILabel new];
    _LabelLine4.backgroundColor = RGB(222, 222, 222);
    [self.view addSubview:_LabelLine4];
    [_LabelLine4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptiveW(16));
        make.top.mas_equalTo(_TextFieldSecondPassWord.mas_bottom).offset(AdaptiveW(21));
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(15));
    }];
    
    _TextFieldVerificationCode = [UITextField new];
    [_TextFieldVerificationCode setPlaceholder:@"请输入手机验证码"];
    [_TextFieldVerificationCode setValue: [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]] forKeyPath:@"_placeholderLabel.font"];
    [_TextFieldVerificationCode setValue:RGB(223, 223, 223) forKeyPath:@"_placeholderLabel.textColor"];
    _TextFieldVerificationCode.clearButtonMode = UITextFieldViewModeWhileEditing;
    _TextFieldVerificationCode.delegate = self;
    _TextFieldVerificationCode.font = [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]];
    _TextFieldVerificationCode.textColor =RGB(33, 31, 30);
    _TextFieldVerificationCode.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_TextFieldVerificationCode];
    [_TextFieldVerificationCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_LabelLine4.mas_bottom).offset(AdaptiveW(23));
        make.left.mas_equalTo(self.view).offset(AdaptiveW(16));
        make.width.mas_equalTo(AdaptiveW(230));
    }];
    
    _ButtonGetCode = [UIButton new];
    [_ButtonGetCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    _ButtonGetCode.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:[AdjustSize adjustFontSize:15]];
    [_ButtonGetCode setTitleColor:RGB(89,201,248) forState:UIControlStateNormal];
    [_ButtonGetCode addTarget:self action:@selector(ClickEvaluate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_ButtonGetCode];
    [_ButtonGetCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_LabelLine4.mas_bottom).offset(AdaptiveW(6));
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(26));
        make.height.mas_equalTo(AdaptiveW(60));
    }];
    
    _LabelLine5 = [UILabel new];
    _LabelLine5.backgroundColor = RGB(222, 222, 222);
    [self.view addSubview:_LabelLine5];
    [_LabelLine5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptiveW(10));
        make.top.mas_equalTo(_TextFieldVerificationCode.mas_bottom).offset(AdaptiveW(21));
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(20));
    }];
    
    
    _ButtonConfirm = [UIButton new];
    [_ButtonConfirm setTitle:@"确定" forState:UIControlStateNormal];
    _ButtonConfirm.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:[AdjustSize adjustFontSize:15]];
    [_ButtonConfirm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_ButtonConfirm addTarget:self action:@selector(ClickPay:) forControlEvents:UIControlEventTouchUpInside];
    [_ButtonConfirm setBackgroundImage:[UIImage imageNamed:@"底部按钮-选中"] forState:UIControlStateNormal];
    [self.view addSubview:_ButtonConfirm];
    [_ButtonConfirm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(_LabelLine5.mas_bottom).offset(AdaptiveW(46));
        make.width.mas_equalTo(AdaptiveW(345));
        make.height.mas_equalTo(AdaptiveW(46));
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
