//
//  ForgetPasswordViewController.m
//  ChargingPileApp
//
//  Created by CityLogistics-PC on 2018/6/22.
//  Copyright © 2018年 XYbaidumap-Demo. All rights reserved.
//

#import "ForgetPasswordViewController.h"

@interface ForgetPasswordViewController ()<UITextFieldDelegate>
/**
 自定义变量
 */
@property(nonatomic,strong)UITextField *TextFieldPhone;//手机号
@property(nonatomic,strong)UIView *ViewLine1;//线1
@property(nonatomic,strong)UITextField *TextFieldVerificationCode;//验证码
@property(nonatomic,strong)UIView *ViewLine2;//线2
@property(nonatomic,strong)UIButton *ButtonGetCode;//获取验证码
@property(nonatomic,strong)UITextField *TextFieldPassWord;//密码
@property(nonatomic,strong)UIView *ViewLine3;//线3
@property(nonatomic,strong)UITextField *TextFieldSecondPassWord;//二次密码
@property(nonatomic,strong)UIView *ViewLine4;//线4
@property(nonatomic,strong)UIButton *ButtonConfirm;//确定

/**
 接口
 */
@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"忘记密码";
    self.view.backgroundColor = RGB(240, 240, 240);
    //  创建注册界面
    [self CreatRegisterView];
}
-(void)CreatRegisterView{
    _TextFieldPhone = [UITextField new];
    [_TextFieldPhone setPlaceholder:@"请输入手机号"];
    [_TextFieldPhone setValue:[UIFont systemFontOfSize:[AdjustSize adjustFontSize:13]] forKeyPath:@"_placeholderLabel.font"];
    _TextFieldPhone.clearButtonMode = UITextFieldViewModeWhileEditing;
    _TextFieldPhone.delegate = self;
    _TextFieldPhone.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_TextFieldPhone];
    [_TextFieldPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AdaptiveW(40));
        make.left.mas_equalTo(self.view).offset(AdaptiveW(40));
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(40));
    }];
    
    _ViewLine1 = [UIView new];
    _ViewLine1.backgroundColor = RGB(222, 222, 222);
    [self.view addSubview:_ViewLine1];
    [_ViewLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptiveW(40));
        make.top.mas_equalTo(_TextFieldPhone.mas_bottom).offset(AdaptiveW(5));
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(40));
    }];
    
    _TextFieldVerificationCode = [UITextField new];
    [_TextFieldVerificationCode setPlaceholder:@"请输入验证码"];
    [_TextFieldVerificationCode setValue:[UIFont systemFontOfSize:[AdjustSize adjustFontSize:13]] forKeyPath:@"_placeholderLabel.font"];
    _TextFieldVerificationCode.clearButtonMode = UITextFieldViewModeWhileEditing;
    _TextFieldVerificationCode.delegate = self;
    _TextFieldVerificationCode.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_TextFieldVerificationCode];
    [_TextFieldVerificationCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_ViewLine1.mas_bottom).offset(AdaptiveW(20));
        make.left.mas_equalTo(self.view).offset(AdaptiveW(40));
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(130));
    }];
    
    _ViewLine2 = [UIView new];
    _ViewLine2.backgroundColor = RGB(222, 222, 222);
    [self.view addSubview:_ViewLine2];
    [_ViewLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptiveW(40));
        make.top.mas_equalTo(_TextFieldVerificationCode.mas_bottom).offset(AdaptiveW(5));
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(130));
    }];
    
    _ButtonGetCode = [UIButton buttonWithType:UIButtonTypeCustom];
    [_ButtonGetCode addTarget:self action:@selector(ClickRegister:) forControlEvents:UIControlEventTouchUpInside];
    [_ButtonGetCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    _ButtonGetCode.titleLabel.font = [UIFont systemFontOfSize:[AdjustSize adjustFontSize:14]];
    [_ButtonGetCode setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:_ButtonGetCode];
    [_ButtonGetCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_TextFieldVerificationCode.mas_right).offset(AdaptiveW(12));
        make.top.mas_equalTo(_ViewLine1.mas_bottom).offset(AdaptiveW(20));
    }];
    
   
    
    _TextFieldPassWord = [UITextField new];
    [_TextFieldPassWord setPlaceholder:@"请输入密码"];
    [_TextFieldPassWord setValue:[UIFont systemFontOfSize:[AdjustSize adjustFontSize:13]] forKeyPath:@"_placeholderLabel.font"];
    _TextFieldPassWord.clearButtonMode = UITextFieldViewModeWhileEditing;
    _TextFieldPassWord.delegate = self;
    _TextFieldPassWord.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_TextFieldPassWord];
    [_TextFieldPassWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_ViewLine2.mas_bottom).offset(AdaptiveW(20));
        make.left.mas_equalTo(self.view).offset(AdaptiveW(40));
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(40));
    }];
    
    _ViewLine3 = [UIView new];
    _ViewLine3.backgroundColor = RGB(222, 222, 222);
    [self.view addSubview:_ViewLine3];
    [_ViewLine3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptiveW(40));
        make.top.mas_equalTo(_TextFieldPassWord.mas_bottom).offset(AdaptiveW(5));
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(40));
    }];
    
    _TextFieldSecondPassWord = [UITextField new];
    [_TextFieldSecondPassWord setPlaceholder:@"请再次输入密码"];
    [_TextFieldSecondPassWord setValue:[UIFont systemFontOfSize:[AdjustSize adjustFontSize:13]] forKeyPath:@"_placeholderLabel.font"];
    _TextFieldSecondPassWord.clearButtonMode = UITextFieldViewModeWhileEditing;
    _TextFieldSecondPassWord.delegate = self;
    _TextFieldSecondPassWord.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_TextFieldSecondPassWord];
    [_TextFieldSecondPassWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_ViewLine3.mas_bottom).offset(AdaptiveW(20));
        make.left.mas_equalTo(self.view).offset(AdaptiveW(40));
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(40));
    }];
    
    _ViewLine4 = [UIView new];
    _ViewLine4.backgroundColor = RGB(222, 222, 222);
    [self.view addSubview:_ViewLine4];
    [_ViewLine4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptiveW(40));
        make.top.mas_equalTo(_TextFieldSecondPassWord.mas_bottom).offset(AdaptiveW(5));
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(self.view).offset(-AdaptiveW(40));
    }];
    
    
    _ButtonConfirm = [UIButton new];
    [_ButtonConfirm setTitle:@"确定" forState:UIControlStateNormal];
    [_ButtonConfirm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_ButtonConfirm setBackgroundColor:[UIColor lightGrayColor]];
    _ButtonConfirm.layer.cornerRadius = 5;
    _ButtonConfirm.userInteractionEnabled = NO;
    [self.view addSubview:_ButtonConfirm];
    [_ButtonConfirm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_ViewLine4.mas_bottom).offset(AdaptiveW(65));
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(AdaptiveW(48));
        make.width.mas_equalTo(AdaptiveW(315));
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
