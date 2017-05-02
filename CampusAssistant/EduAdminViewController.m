//
//  EduAdminViewController.m
//  CampusAssistant
//
//  Created by 吴斌 on 16/12/28.
//  Copyright © 2016年 wubin. All rights reserved.
//

#import "EduAdminViewController.h"
#import "UIButton+Category.h"
@interface EduAdminViewController ()<UIWebViewDelegate>
@property(nonatomic, weak) UIWebView* webView;
@end

@implementation EduAdminViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupWebView];
    [self setupNavigationBar];

}
- (void)setupWebView{
    UIWebView *webView = [[UIWebView alloc] init];
    self.webView = webView;
    webView.backgroundColor = [UIColor whiteColor];
    
    CGRect frame = self.view.frame;
    frame.size.height -= 100;
    webView.frame = frame;
    webView.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.ccav.xyz/CampusAssistant/index.html"]];
    [webView loadRequest:request];
    [self.view addSubview:webView];
}
- (void)setupNavigationBar{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backup)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
}
- (void)backup{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
}


@end
