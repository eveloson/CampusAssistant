//
//  InformationViewController.m
//  CampusAssistant
//
//  Created by 吴斌 on 16/12/28.
//  Copyright © 2016年 wubin. All rights reserved.
//

#import "InformationViewController.h"
#import "LjjUISegmentedControl.h"
@interface InformationViewController () <UIWebViewDelegate,UIScrollViewDelegate,LjjUISegmentedControlDelegate>
@property(nonatomic, weak) LjjUISegmentedControl* segmentControl;
@property(nonatomic, weak) UIScrollView* scrollView;
@property(nonatomic, strong) NSMutableArray* webViewArray;

@end

@implementation InformationViewController

- (NSMutableArray *)webViewArray{
    if (_webViewArray == nil) {
        _webViewArray = [NSMutableArray array];
    }
    return _webViewArray;
}
- (void)viewDidLoad {
    //    iOS7之后，当UIViewController成为UINavigationController的控制视图,UIViewController的控制视图上的第一个子视图是UIScrollView，UIScrollView会往下偏移64px的位置，64px是UINavigationBar的44px高度加上状态条20px的高度。self.automaticallyAdjustsScrollViewInsets = NO;取消偏移

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupScrollView];
    [self setupWebView];
    [self setupSegmentControl];
    [self setupNavigationBar];
    
    
}
- (void)setupNavigationBar{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backup)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
}
- (void)backup{
    NSInteger selectSegment = self.segmentControl.selectSeugment;
    UIWebView* webView = self.webViewArray[selectSegment];
    if ([webView canGoBack]) {
        [webView goBack];
    }

}
- (void)setupScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kSegmentControlHeight+5, kWidth, kHeight-64-49-30)];
    self.scrollView = scrollView;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.scrollEnabled = NO; //关闭滚动
//    scrollView.directionalLockEnabled = YES;//横竖屏不同时滚动锁定
    CGFloat contentH = kHeight;
    CGFloat contentW = kWidth * kSegmentNum;
    scrollView.contentSize = CGSizeMake(contentW, contentH-70);
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
}
- (void)setupWebView{
    NSArray *urlArray = kWebURLs;
    for (int i = 0; i<kSegmentNum; i++) {
        UIWebView *webView = [[UIWebView alloc] init];
        webView.backgroundColor = [UIColor whiteColor];
        CGFloat webViewX = i * kWidth;
        webView.frame = CGRectMake(webViewX, 0, kWidth, kHeight);
        webView.delegate = self;
        NSURL *url = [NSURL URLWithString:[urlArray objectAtIndex:i]];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webView loadRequest:request];
        [self.webViewArray addObject:webView];
        [self.scrollView addSubview:webView];
    }
}

- (void)setupSegmentControl{
    NSArray *array = kWebTitles;
    LjjUISegmentedControl *segContrl = [[LjjUISegmentedControl alloc] initWithFrame:CGRectMake(kSegmentControlHorizonMargin, 5, kWidth-2*kSegmentControlHorizonMargin, kSegmentControlHeight)];
    self.segmentControl = segContrl;
    [segContrl AddSegumentArray:array];
    segContrl.delegate = self;
    segContrl.LJBackGroundColor = [UIColor clearColor];
    [segContrl selectTheSegument:0];
    [self.view addSubview:segContrl];
//    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:array];
//    segmentControl.frame = CGRectMake(10, 70, kWidth-20, 20);
//    segmentControl.selectedSegmentIndex = 0;
//    [segmentControl addTarget:self action:@selector(segmentOnClick:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:segmentControl];
}
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    int index = scrollView.contentOffset.x;
//    if (index != 0) {
//        NSLog(@"%d",index);
//        [self.segmentControl selectTheSegument: index / ];
//    }
//    
//}
- (void)uisegumentSelectionChange:(NSInteger)selection{
        CGFloat offsetX = selection * kWidth;
        CGPoint offset = CGPointMake(offsetX, 0);
        [self.scrollView setContentOffset:offset animated:YES];
}

@end
