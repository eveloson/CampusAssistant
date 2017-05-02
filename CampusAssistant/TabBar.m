//
//  TabBar.m
//  Weibo
//
//  Created by BinWu on 16/6/3.
//  Copyright © 2016年 c2012y@qq.com. All rights reserved.
//

#import "TabBar.h"
#import "TabBarButton.h"
@interface TabBar ()

@property (nonatomic, weak) TabBarButton *selectedBtn;
@property (nonatomic, strong) NSMutableArray *tabBarBtns;
@end

@implementation TabBar

- (NSMutableArray *)tabBarBtns{
    if (_tabBarBtns == nil) {
        _tabBarBtns = [NSMutableArray array];
    }
    return _tabBarBtns;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        if (!iOS7) {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
        }
    }
    return self;
}

- (void)addTabBarButtonWithItem:(UITabBarItem *)item{
    //1.创建按钮
    TabBarButton *btn = [[TabBarButton alloc] init];
    [self addSubview:btn];
    //5.添加到tabBarBtn数组
    [self.tabBarBtns addObject:btn];

    //2. 设置数据
    btn.item = item;
    
    //3.监听按钮点击
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    //4.默认点击第0个
    if (self.tabBarBtns.count == 1) {
        [self btnClick:btn]; 
    }
}

- (void)btnClick:(TabBarButton *)btn{
    //1. 通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:(int)self.selectedBtn.tag to:(int)btn.tag];
    }
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat tabH = self.frame.size.height;
    CGFloat tabW =  self.frame.size.width;
    CGFloat btnW = tabW / self.subviews.count;
    CGFloat btnH = tabH;
    CGFloat btnY = 0;

    for (int index = 0; index < self.tabBarBtns.count; index ++) {
        //1.取出按钮
        TabBarButton *btn = self.tabBarBtns[index];
        //2.设置按钮的frame
        CGFloat btnX = index * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        //3.绑定tag
        btn.tag = index;
    }
}
@end
