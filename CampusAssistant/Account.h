//
//  Account.h
//  Weibo
//
//  Created by BinWu on 16/6/5.
//  Copyright © 2016年 c2012y@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject <NSCoding>

@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, strong) NSDate *expireTime;
@property (nonatomic, assign) long long expires_in;
@property (nonatomic, assign) long long remind_in;
@property (nonatomic, assign) long long uid;
@property(nonatomic, copy) NSString *name;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)accountWithDict:(NSDictionary *)dict;

@end