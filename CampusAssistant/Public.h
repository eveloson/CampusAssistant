//
//  Public.h
//  JKCourse
//
//  Created by MacOS on 15-1-23.
//  Copyright (c) 2015年 Joker. All rights reserved.
//

#ifndef JKCourse_Public_h
#define JKCourse_Public_h

#import <Availability.h>

//获取设备的物理高度
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)
//获取设备的物理宽度
#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
//系统的版本号
#define SystemVersion ([[[UIDevice currentDevice] systemVersion] floatValue])

#define RGBColor(r,g,b,a) ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a])
#define WEEKDAY_BGCOLOR  ([UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.5])
#define WEEKDAY_SELECT_COLOR ([UIColor colorWithRed:32/255.0 green:81/255.0 blue:148/255.0 alpha:0.23])
#define WEEKDAY_FONT_COLOR ([UIColor colorWithRed:32/255.0 green:81/255.0 blue:148/255.0 alpha:1])
#define kWidthGrid  (ScreenWidth/7.5)   //周课表中一个格子的宽度

//系统的版本号
#define SystemVersion ([[[UIDevice currentDevice] systemVersion] floatValue])

#define RGBColor(r,g,b,a) ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a])

// 课程表中
#define WEEKDAY_BGCOLOR  ([UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.5])
#define WEEKDAY_SELECT_COLOR ([UIColor colorWithRed:32/255.0 green:81/255.0 blue:148/255.0 alpha:0.23])
#define WEEKDAY_FONT_COLOR ([UIColor colorWithRed:32/255.0 green:81/255.0 blue:148/255.0 alpha:1])
#define kWidthGrid  (ScreenWidth/7.5)   //周课表中一个格子的宽度

//NSUserDefaults 中的Key常量
#define CURRENTYEAR   @"CURRENTYEAR"
#define CURRENTTERM   @"CURRENTTERM"
#define USERNAME      @"USERNAME"
#define CURRENTWEEK   @"CURRENTWEEK"

#endif
