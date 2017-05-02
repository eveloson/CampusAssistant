//
//  LoginViewController.m
//  CampusAssistant
//
//  Created by 吴斌 on 16/12/28.
//  Copyright © 2016年 wubin. All rights reserved.
//

#import "LoginViewController.h"
#import "TextFieldBackground.h"
#import "TabBarViewController.h"
#import "MBProgressHUD+WB.h"
#import <AFNetworking.h>
#import "Account.h"
#import "AccountTool.h"
#import <MJExtension.h>
@interface LoginViewController ()
@property(nonatomic, strong) UILabel* appName;
@property (nonatomic,strong) UITextField *account;
@property (nonatomic,strong) UITextField *password;
@property (nonatomic,strong) UIButton *loginButton;
@property(nonatomic, strong) TextFieldBackground *background;
@property(nonatomic, strong) AFHTTPSessionManager* mgr;
@end

@implementation LoginViewController

- (AFNetworkReachabilityManager *)mgr{
    if (_mgr == nil) {
        _mgr = [[AFHTTPSessionManager alloc] init];
    }
    return _mgr;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    //初始化UI
    [self setupUI];
}

- (void)setupUI{
    [self.view setBackgroundColor:[UIColor colorWithRed:51/255.0 green:204/255.0 blue:255/255.0 alpha:1]];
    CGFloat appNameH = 45;
    CGFloat appNameW = self.view.bounds.size.width;
    _appName = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, appNameW, appNameH)];
    [_appName setText:@"校园助手"];
    _appName.font = [UIFont systemFontOfSize:40];
    _appName.textColor = [UIColor whiteColor];
    _appName.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_appName];
    //初始化登录框
    _background = [[TextFieldBackground alloc] initWithFrame:CGRectMake(20, kHeight/2 - 100, self.view.frame.size.width-40, 100)];
    [_background setBackgroundColor:[UIColor whiteColor]];
    [[_background layer] setCornerRadius:5];
    [[_background layer] setMasksToBounds:YES];
    _account=[[UITextField alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-40, 50)];
    _account.backgroundColor=[UIColor clearColor];
    _account.placeholder=[NSString stringWithFormat:@"学号"];
    _account.keyboardType = UIKeyboardTypeNumberPad;
    [_background addSubview:_account];
    _password=[[UITextField alloc] initWithFrame:CGRectMake(10, 50, self.view.frame.size.width-40, 50)];
    _password.backgroundColor=[UIColor clearColor];
    _password.placeholder=[NSString stringWithFormat:@"密码"];
    _account.layer.cornerRadius = 5.0;
    //隐藏密码
    _password.secureTextEntry = YES;
    [_background addSubview:_password];
    [self.view addSubview:_background];
    //初始化登录按钮
    _loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setFrame:CGRectMake(20, CGRectGetMaxY(self.background.frame) + 30, self.view.frame.size.width-40, 50)];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _loginButton.layer.cornerRadius = 5.0;
    [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_loginButton];

}
- (void)login{
//    if (self.account.text.length == 0  || self.password.text.length == 0) {
//        [MBProgressHUD showError:@"学号和密码不能为空!"];
//    }else {
//        [self loginCheck];
//    }
    UIWindow *window = [[UIApplication sharedApplication] delegate].window;
    window.rootViewController = [[TabBarViewController alloc] init];
    [window makeKeyAndVisible];

}

- (void)loginCheck{
    //1.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"stuId"]     = self.account.text;
    params[@"stuPass"] = self.password.text;
    [self.mgr POST:@"http://localhost:8080/CampusAssistant/1/tokens" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        BOOL status = responseObject[@"status"];
//        if (status == YES) {
//            Account* account = [Account mj_objectWithKeyValues:responseObject[@"data"]];
//            [AccountTool saveAccount:account];
//            UIWindow *window = [[UIApplication sharedApplication] delegate].window;
//            window.rootViewController = [[TabBarViewController alloc] init];
//            [window makeKeyAndVisible];
//        } else {
//            [MBProgressHUD showError:responseObject[@"errMsg"]];
//        }
        if([self.account.text isEqualToString:@"1512401013"] && [self.password.text isEqualToString:@"112233"]){
            UIWindow *window = [[UIApplication sharedApplication] delegate].window;
            window.rootViewController = [[TabBarViewController alloc] init];
            [window makeKeyAndVisible];
           } else {
                [MBProgressHUD showError:@"学号或密码错误！"];
         }
        
           } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {        [MBProgressHUD showError:@"网络连接失败，请重试"];
    }];
}


@end
