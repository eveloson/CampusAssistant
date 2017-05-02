//
//  User.m
//  Weibo
//
//  Created by BinWu on 16/6/6.
//  Copyright © 2016年 c2012y@qq.com. All rights reserved.
//

#import "User.h"

@implementation User
+ (instancetype)userWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.stu_Id = dict[@"stu_Id"];
        self.stu_Name = dict[@"stu_Name"];
        self.profile_image_url = dict[@"profile_image_url"];
    }
    
    return self;
}
@end
