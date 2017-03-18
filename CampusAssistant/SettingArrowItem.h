//
//  SettingArrowItem.h
//  a28-彩票
//
//  Created by BinWu on 16/5/26.
//  Copyright © 2016年 BinWu. All rights reserved.
//

#import "SettingItem.h"

@interface SettingArrowItem : SettingItem
//点击这行cell跳转的控制器
@property (nonatomic, assign) Class destVcClass;

+ (instancetype)itemWithIcon:(NSString*)icon title:(NSString *)title destVcClass:(Class) destVcClass;
+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class) destVcClass;
@end
