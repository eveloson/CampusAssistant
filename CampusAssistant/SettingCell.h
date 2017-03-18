//
//  SettingCell.h
//  a28-彩票
//
//  Created by BinWu on 16/5/26.
//  Copyright © 2016年 BinWu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SettingItem;
@interface SettingCell : UITableViewCell
@property (nonatomic, strong) SettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
