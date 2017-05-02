//
//  User.h
//  Weibo
//
//  Created by BinWu on 16/6/6.
//  Copyright © 2016年 c2012y@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface User : NSObject
//用户ID
@property (nonatomic, copy) NSString *stu_Id;
//用户昵称
@property (nonatomic, copy) NSString *stu_Name;
//用户头像
@property (nonatomic, copy) NSString *profile_image_url;

@end
