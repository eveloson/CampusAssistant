//
//  AboutViewController.m
//  a28-彩票
//
//  Created by BinWu on 16/5/28.
//  Copyright © 2016年 BinWu. All rights reserved.
//
#import "AboutViewController.h"
#import "SettingArrowItem.h"
#import "SettingGroup.h"
@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SettingItem *support = [SettingArrowItem itemWithTitle:@"评分支持" destVcClass:nil];
    SettingItem *call = [SettingArrowItem itemWithTitle:@"客户电话" destVcClass:nil];
    call.subtitle = @"10010";
    call.option = ^{
        
    };
    SettingGroup *group = [[SettingGroup alloc] init];
    group.items = @[support,call];
    [self.data addObject:group];
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
