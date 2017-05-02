//
//  StatusFrame.m
//  Weibo
//
//  Created by BinWu on 16/6/6.
//  Copyright © 2016年 c2012y@qq.com. All rights reserved.
//

#import "StatusFrame.h"
#import "Status.h"
#import "User.h"



@implementation StatusFrame
/**
 *  获得微博模型数据后，根据微博数据计算frame
 */
- (void)setStatus:(Status *)status{
    _status = status;
    //cell的宽度
    CGFloat cellW = kWidth;
    //1.topView
    CGFloat topViewW = cellW;
    CGFloat topViewH = 0;
    CGFloat topViewX = 0;
    CGFloat topViewY = 0;
    //2.头像
    CGFloat iconViewWH = 42;
    CGFloat iconViewX = kStatusCellLeftMargin;
    CGFloat iconViewY = kStatusCellTopMargin;
    _iconViewF = CGRectMake(iconViewX, iconViewY, iconViewWH, iconViewWH);
    //3.昵称
    CGFloat nameLabelX = CGRectGetMaxX(_iconViewF) + kStatusCellLeftMargin;
    CGFloat nameLabelY = iconViewY + 3;
    CGSize nameLabelSize = [status.user.stu_Name sizeWithFont:kStatusNameFont];
    _nameLabelF = (CGRect){nameLabelX,nameLabelY,nameLabelSize};
    //5.时间
    CGFloat timeLabelX = nameLabelX;
    CGFloat timeLabelY = CGRectGetMaxY(_nameLabelF) + 3;
    CGSize timeLabelSize = [status.created_at sizeWithFont:kStatusTimeFont];
    timeLabelSize.width++;
    _timeLabelF = (CGRect){timeLabelX,timeLabelY,timeLabelSize};
    //7.微博正文内容
    CGFloat contentLabelX = iconViewX;
    CGFloat contentLabelY = CGRectGetMaxY(_iconViewF) + 5;
    CGFloat contentLabelMaxW = topViewW - 2 * kStatusCellLeftMargin;
    CGSize contentLabelSize = [status.text sizeWithFont:kStatusContentFont constrainedToSize:CGSizeMake(contentLabelMaxW, MAXFLOAT)];
    _contentLabelF = (CGRect){contentLabelX,contentLabelY,contentLabelSize};
    topViewH = CGRectGetMaxY(_contentLabelF);
    _topViewF = CGRectMake(topViewX, topViewY, topViewW, topViewH);
    //14.cell的高度
    _cellHeight = CGRectGetMaxY(_topViewF) + kStatusCellTopMargin+10;


}
@end
