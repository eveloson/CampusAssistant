//
//  QuestionSquareTableViewController.m
//  CampusAssistant
//
//  Created by 吴斌 on 16/12/28.
//  Copyright © 2016年 wubin. All rights reserved.
//

#import "QuestionSquareTableViewController.h"
#import "Status.h"
#import "User.h"
#import "StatusFrame.h"
#import "StatusCell.h"
#import <UIImageView+WebCache.h>
#import <MJExtension.h>
#import <MJRefresh.h>
#import <AFNetworking.h>
#import "UIImage+Category.h"
#import "UIBarButtonItem+Category.h"
#import "ComposeViewController.h"
#import "NavigationController.h"
@interface QuestionSquareTableViewController () <UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *statusFrames;
@end

@implementation QuestionSquareTableViewController

- (NSMutableArray *)statusFrames{
    if (_statusFrames == nil) {
        _statusFrames = [NSMutableArray array];
    }
    return _statusFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //0.集成刷新控件
    [self setupRefreshView];
    //取消cell之间的分割线
    self.tableView.backgroundColor = RGB(244, 243, 241);
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    //    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, kStatusCellTopMargin, 0);
    [self setupNavigationBar];
}
- (void)setupNavigationBar{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"tabbar_compose_background_icon_add" highIcon:@"tabbar_compose_background_icon_add" target:self action:@selector(addQuestion)];
                                              
}

- (void)addQuestion{
    ComposeViewController *vc = [[ComposeViewController alloc] init];
    NavigationController *nc = [[NavigationController alloc] initWithRootViewController:vc];
    //    [[self topVC] presentViewController:nc animated:YES completion:nil];
    [self presentViewController:nc animated:YES completion:nil];
}
/**
 集成刷新控件
 
 */
- (void)setupRefreshView{
    //1.下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData:)];
    self.tableView.mj_header = header;
    [header beginRefreshing];
    //2.上拉刷新
    MJRefreshAutoFooter *footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData:)];
    self.tableView.mj_footer = footer;
}

- (void)loadMoreData:(MJRefreshComponent *)refreshView{
    if ([refreshView isKindOfClass:[MJRefreshHeader class]]) {
        [self headerLoadMoreData];
    } else {
        [self footerLoadMoreData];
    }
}
/**
 手动进入刷新状态调用
 
 @param refreshControl <#refreshControl description#>
 */
- (void)headerLoadMoreData{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //2.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"access_token"]     = @"2.00htvFTBj3MDdEdb34816d9eR6SlpC";
    params[@"count"] = @20;
    if(self.statusFrames.count){
        StatusFrame *statusFrame = self.statusFrames[0];
        params[@"since_id"] = statusFrame.status.idstr;
    }
    
    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *statusArray = [Status mj_objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        //创建frame模型对象
        NSMutableArray *statusFrameArray = [NSMutableArray array];
        for (Status *status in statusArray) {
            StatusFrame *statusFrame = [[StatusFrame alloc] init];
            //传递模型数据
            statusFrame.status = status;
            [statusFrameArray addObject:statusFrame];
        }
        //将新数据插入到修数据前面
        [self.statusFrames insertObjects:statusFrameArray atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statusFrameArray.count)]];
        //刷新表格
        [self.tableView reloadData];
        //显示最新微博的数量
        [self showNewStatusCount:statusFrameArray.count];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)footerLoadMoreData{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //2.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"access_token"]     = @"2.00htvFTBj3MDdEdb34816d9eR6SlpC";
    params[@"count"] = @20;
    if(self.statusFrames.count){
        StatusFrame *statusFrame = [self.statusFrames lastObject];
        long long maxId = [statusFrame.status.idstr longLongValue];
        params[@"max_id"] = @(maxId-1);
    }
    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *statusArray = [Status mj_objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        //创建frame模型对象
        NSMutableArray *statusFrameArray = [NSMutableArray array];
        for (Status *status in statusArray) {
            StatusFrame *statusFrame = [[StatusFrame alloc] init];
            //传递模型数据
            statusFrame.status = status;
            [statusFrameArray addObject:statusFrame];
        }
        //将新数据插入到修数据前面
        [self.statusFrames insertObjects:statusFrameArray atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(self.statusFrames.count, statusFrameArray.count)]];
        //刷新表格
        [self.tableView reloadData];
        //显示最新微博的数量
        [self showNewStatusCount:statusFrameArray.count];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_footer endRefreshing];
    }];
    
}
- (void)showNewStatusCount:(NSUInteger)count{
    //1.创建一个按钮
    UIButton *btn = [[UIButton alloc] init];
    [self.navigationController.view insertSubview:btn belowSubview:self.navigationController.navigationBar];
    //2.设置图片和文字
    btn.userInteractionEnabled = NO;
    [btn setBackgroundImage:[UIImage resizableImage:@"timeline_new_status_background"] forState:UIControlStateNormal];
    if (count) {
        NSString *title = [NSString stringWithFormat:@"更新了%lu条微博", (unsigned long)count];
        [btn setTitle:title forState:UIControlStateNormal];
    } else {
        [btn setTitle:@"没有新微博" forState:UIControlStateNormal];
    }
    //3.设置按钮的初始frame
    CGFloat btnH = 30;
    CGFloat btnY = 64 - btnH;
    CGFloat btnW = self.view.frame.size.width;
    CGFloat btnX = 0;
    btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    //4.动画
    [UIView animateWithDuration:0.5 animations:^{
        btn.transform = CGAffineTransformMakeTranslation(0, btnH);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            //恢复原来
            btn.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [btn removeFromSuperview];
        }];
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statusFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StatusCell *cell = [StatusCell cellWithTableView:tableView];
    cell.statusFrame = self.statusFrames[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatusFrame *statusFrame = self.statusFrames[indexPath.row];
    return statusFrame.cellHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
