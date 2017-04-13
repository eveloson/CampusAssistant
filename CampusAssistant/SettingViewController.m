//
//  SettingViewController.m
//  a28-彩票
//
//  Created by BinWu on 16/5/20.
//  Copyright © 2016年 BinWu. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingItem.h"
#import "SettingGroup.h"
#import "SettingArrowItem.h"
#import "SettingSwitchItem.h"
#import "ShareViewController.h"
#import "AboutViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

@implementation SettingViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //1.标题
    self.title = @"设置";
    [self setupGroup0];
    [self setupGroup1];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];  
}
- (void)setupGroup0 {
    //0组
    
    SettingItem *pushNotice = [SettingArrowItem itemWithIcon:@"MorePush" title:@"注销账号"];
    SettingItem *soundEffect =[SettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    //        //1组
    
    //        NSArray *arr1 = @[it10];
    pushNotice.option = ^{
        LoginViewController *login = [[LoginViewController alloc] init];
        AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
        delegate.window.rootViewController = login;
    };
    SettingGroup *group = [[SettingGroup alloc]init];
    group.items = @[pushNotice, soundEffect];
    
    [self.data addObject:group];
}
- (void)setupGroup1{
    
    SettingGroup *group = [[SettingGroup alloc]init];
    SettingItem *update = [SettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本" ];
    update.option = ^{
        
    };
    SettingItem *help = [SettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" ];
    SettingItem *share = [SettingArrowItem itemWithIcon:@"MoreHelp" title:@"分享" destVcClass:[ShareViewController class]];
    SettingItem *viewMsg = [SettingArrowItem itemWithIcon:@"MoreHelp" title:@"查看消息"];
    SettingItem *about = [SettingArrowItem itemWithIcon:@"MoreHelp" title:@"关于" destVcClass:[AboutViewController class]];
    group.items = @[update, help,share,viewMsg,about];
    [self.data addObject:group];

}



@end
