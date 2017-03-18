//
//  SettingItem.m
//  a28-彩票
//
//  Created by BinWu on 16/5/25.
//  Copyright © 2016年 BinWu. All rights reserved.
//  每一个cell都对应一个SettingItem模型

#import "SettingItem.h"

@implementation SettingItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title{
    SettingItem *item = [self itemWithTitle:title];
    item.icon = icon;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title{
    SettingItem *item = [[self alloc] init];
    item.title = title;
    return item;

}

@end
