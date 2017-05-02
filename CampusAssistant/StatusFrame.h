//
//  StatusFrame.h
//  Weibo
//
//  Created by BinWu on 16/6/6.
//  Copyright © 2016年 c2012y@qq.com. All rights reserved.
//  一个cell对应一个StatusFrame对象

#import <UIKit/UIKit.h>




@class Status;
@interface StatusFrame : NSObject
@property (nonatomic, strong) Status *status;
//顶部view
@property (nonatomic, assign, readonly) CGRect topViewF;
//头像
@property (nonatomic, assign, readonly) CGRect iconViewF;
//昵称
@property (nonatomic, assign, readonly) CGRect nameLabelF;
//时间
@property (nonatomic, assign, readonly) CGRect timeLabelF;
//正文
@property (nonatomic, assign, readonly) CGRect contentLabelF;
//cell的高度
@property (nonatomic, assign, readonly) CGFloat cellHeight;
@end
