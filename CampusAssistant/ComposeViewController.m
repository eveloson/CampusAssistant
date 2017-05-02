//
//  ComposeViewController.m
//  Weibo
//
//  Created by 吴斌 on 16/12/28.
//  Copyright © 2016年 c2012y@qq.com. All rights reserved.
//

#import "ComposeViewController.h"
#import "TextView.h"
@interface ComposeViewController ()
@property(nonatomic, weak) TextView* textView;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置导航栏
    [self setupNavBar];
    
    //添加textView
    [self setupTextView];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.textView becomeFirstResponder];
}
- (void)setupNavBar{
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleBordered target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    self.title = @"提问题";
}

- (void)setupTextView{
    //1.添加
    TextView *textView = [[TextView alloc] init];
    textView.font = [UIFont systemFontOfSize:16];
    textView.frame = self.view.bounds;
    [self.view addSubview:textView];
    self.textView = textView;
    //2.监听textView文字改变的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:textView];
}

- (void)textDidChange{
    self.navigationItem.rightBarButtonItem.enabled = self.textView.text.length;
}
- (void)cancel{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 发微博
 */
- (void)send{
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
