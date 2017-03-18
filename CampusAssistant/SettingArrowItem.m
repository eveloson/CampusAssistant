//
//  SettingArrowItem.m
//  a28-彩票
//
//  Created by BinWu on 16/5/26.
//  Copyright © 2016年 BinWu. All rights reserved.
//

#import "SettingArrowItem.h"

@implementation SettingArrowItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(__unsafe_unretained Class)destVcClass{
    SettingArrowItem *item = [self itemWithIcon:icon title:title];
    item.destVcClass = destVcClass;
    return item;
}
+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass{
    return [self itemWithIcon:nil title:title destVcClass:destVcClass];
}
@end
