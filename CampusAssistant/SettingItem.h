//
//  SettingItem.h
//  a28-彩票
//
//  Created by BinWu on 16/5/25.
//  Copyright © 2016年 BinWu. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^SettingItemOption)();
@interface SettingItem : NSObject
@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *title;
// 点击cell需要做的事

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) SettingItemOption option;
+ (instancetype)itemWithIcon:(NSString*)icon title:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title;

@end
