//
//  StatusTopView.m
//  Weibo
//
//  Created by 吴斌 on 16/12/26.
//  Copyright © 2016年 c2012y@qq.com. All rights reserved.
//

#import "StatusTopView.h"
#import "StatusFrame.h"
#import "User.h"
#import "Status.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Category.h"
@interface StatusTopView ()
//顶部view
@property (nonatomic, weak) UIImageView *topView;
//头像
@property (nonatomic, weak) UIImageView *iconView;
//昵称
@property (nonatomic, weak) UILabel *nameLabel;
//时间
@property (nonatomic, weak) UILabel *timeLabel;
//正文
@property (nonatomic, weak) UILabel *contentLabel;
@end

@implementation StatusTopView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //1.设置图片
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizableImage:@"timeline_card_top_background"];
        self.highlightedImage = [UIImage resizableImage:@"timeline_card_top_background_highlighted"];
        //2.头像
        UIImageView *iconView =  [[UIImageView alloc] init];
        self.iconView = iconView;
        [self addSubview:iconView];
        //5.昵称
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = kStatusNameFont;
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
        //6.时间
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.font = kStatusTimeFont;
        timeLabel.textColor = kStatusTimeColor;
        self.timeLabel = timeLabel;
        [self addSubview:timeLabel];
        //8.正文
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.numberOfLines = 0;
        contentLabel.font = kStatusContentFont;
        contentLabel.textColor = kStatusContentColor;
        self.contentLabel = contentLabel;
        [self addSubview:contentLabel];
    }
    return self;
}

- (void)setStatusFrame:(StatusFrame *)statusFrame{
    _statusFrame = statusFrame;
    //0.取出模型数据
    Status *status = self.statusFrame.status;
    User *user = status.user;
    //1.topView
    self.topView.frame = self.statusFrame.topViewF;
    //2.头像
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    self.iconView.frame = self.statusFrame.iconViewF;
    //3.昵称
    self.nameLabel.text = user.stu_Name;
    self.nameLabel.frame = self.statusFrame.nameLabelF;
    //5.时间
    self.timeLabel.text = status.created_at;
    self.timeLabel.frame = self.statusFrame.timeLabelF;
    //7.正文
    self.contentLabel.text = status.text;
    self.contentLabel.frame = self.statusFrame.contentLabelF;
}

@end
