//
//  ShareViewController.m
//  a28-彩票
//
//  Created by BinWu on 16/5/28.
//  Copyright © 2016年 BinWu. All rights reserved.
//

#import "ShareViewController.h"
#import "SettingArrowItem.h"
#import "SettingGroup.h"
#import <MessageUI/MessageUI.h>
@interface ShareViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SettingItem *sina = [SettingArrowItem itemWithTitle:@"新浪微博" destVcClass:nil];
    SettingItem *sms = [SettingArrowItem itemWithTitle:@"短信分享" destVcClass:nil];
 
    SettingItem *mail = [SettingArrowItem itemWithTitle:@"邮件分享" destVcClass:nil];
    __unsafe_unretained ShareViewController *share = self;
    mail.option = ^{
        MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
        vc.mailComposeDelegate = share;
    };
    SettingGroup *group = [[SettingGroup alloc] init];
    group.items = @[sina,sms,mail];
    [self.data addObject:group];
    
}

- (void)dealloc{
    NSLog(@"%@",@"Share ----dealloc");
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
