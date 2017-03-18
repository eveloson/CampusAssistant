//
//  SettingGroup.h
//  a28-彩票
//
//  Created by BinWu on 16/5/25.
//  Copyright © 2016年 BinWu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingGroup : NSObject
@property (nonatomic, copy) NSString *header;

@property (nonatomic, copy) NSString *footer;

@property (nonatomic, strong) NSArray *items;
@end
