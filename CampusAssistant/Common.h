//
//  Common.h
//  Weibo
//
//  Created by 吴斌 on 16/12/28.
//  Copyright © 2016年 c2012y@qq.com. All rights reserved.
//

#ifndef Common_h
#define Common_h


//一个项目里面可能有好几个类都需要实现单例模式。为了更高效的编码，可以利用c语言中宏定义来实现。

//首先宏定义一个单例实现（在.pch/Header文件中拷贝如下代码加入即可）

//这里假设了实例的分享方法叫 shared"className"

//因为方法名 shared"className"是连在一起的，为了让宏能够正确替换掉签名中的“className”需要在前面加上 ##

//当宏的定义超过一行时，在末尾加上“\”表示下一行也在宏定义范围内。

//注意最后一行不需要加"\”。

// @interface

#define singleton_interface(class) + (instancetype)shared##class;

// @implementation
#define singleton_implementation(class) \
static class *_instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
\
return _instance; \
} \
\
+ (instancetype)shared##class \
{ \
if (_instance == nil) { \
_instance = [[class alloc] init]; \
} \
\
return _instance; \
}

//0.帐号相关
#define kAppKey             @"4241570953"
#define kRedirectURI        @"https://api.weibo.com/oauth2/default.html"
#define kclient_secret      @"fa6b26dcd8caf8eb4f2b057b3fb338dd"
#define kLoginURL           [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",kAppKey,kRedirectURI]
#define kAccessTokenURL     @"https://api.weibo.com/oauth2/access_token"
//第三发框架



#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define kWidth [UIScreen mainScreen].bounds.size.width

#define kHeight [UIScreen mainScreen].bounds.size.height

#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


//1.微博cell的属性
//昵称字体
#define kStatusNameFont [UIFont systemFontOfSize:14]
//时间字体
#define kStatusTimeFont [UIFont systemFontOfSize:10]
//来源字体
#define kStatusSourceFont kStatusTimeFont
//正文字体
#define kStatusContentFont [UIFont systemFontOfSize:15]
//被转发微博正文字体
#define kRetweetStatusContentFont kStatusContentFont
//被转发作者昵称字体
#define kRetweetStatusNameFont kStatusNameFont

#define kStatusCellTopMargin 8
#define kStatusCellLeftMargin 8

#define kStatusNameColor RGB(38, 38, 38)
#define kStatusNameVipColor RGB(229, 74, 36);
#define kStatusTimeColor  RGB(129, 129, 129)
#define kStatusSourceColor kStatusTimeColor
#define kStatusContentColor RGB(38,38,38)
#define kRetweetContentColor RGB(80,80,80)
#define PhotoW (kWidth-kStatusCellLeftMargin*2-PhotoMargin*2)/3
#define PhotoH PhotoW
//图片间隔
#define PhotoMargin 3
#define kWidthGrid  (kWidth/7.5)   //周课表中一个格子的宽度


//自定义Log
#ifdef DEBUG
#define WLog(...) NSLog(__VA_ARGS__)
#else
#define WLog(...)
#endif

//segment数量
#define kSegmentNum 3
#define kSegmentControlHorizonMargin 10
#define kSegmentControlHeight 20

#define kWebTitles  [NSArray arrayWithObjects:@"学校新闻", @"通知公告", @"学子快讯",nil];
#define kWebURLs  [NSArray arrayWithObjects:@"http://weixin.jit.edu.cn/jit-weixin/wx/XXYW", @"http://weixin.jit.edu.cn/jit-weixin/wx/TZGG", @"http://weixin.jit.edu.cn/jit-weixin/wx/XZKX",nil];






#endif /* Common_h */
