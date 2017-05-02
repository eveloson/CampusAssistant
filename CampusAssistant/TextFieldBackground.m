//
//  TextFieldBackground.m
//  CampusAssistant
//
//  Created by 吴斌 on 16/12/28.
//  Copyright © 2016年 wubin. All rights reserved.
//

#import "TextFieldBackground.h"
#define kTextFieldBackgroundLineWidth 0.2
#define kTextFieldBackgroundLeftMargin 5
#define kTextFieldBackgroundTopDownMargin (self.bounds.size.height/2)
@implementation TextFieldBackground

- (void)drawRect:(CGRect)rect{
    //获取绘图上下文
    CGContextRef context=UIGraphicsGetCurrentContext();
    //设置粗细
    CGContextSetLineWidth(context,kTextFieldBackgroundLineWidth);
    //开始绘图
    CGContextBeginPath(context);
    //移动到开始绘图点
    CGContextMoveToPoint(context, kTextFieldBackgroundLeftMargin, kTextFieldBackgroundTopDownMargin);
    //移动到第二个点
    CGContextAddLineToPoint(context,self.frame.size.width-kTextFieldBackgroundLeftMargin, kTextFieldBackgroundTopDownMargin);
    //关闭路径
    CGContextClosePath(context);
    //设置颜色
    [[UIColor grayColor] setStroke];
    //绘图
    CGContextStrokePath(context);}

@end
