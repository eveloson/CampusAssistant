//
//  SettingCell.m
//  a28-彩票
//
//  Created by BinWu on 16/5/26.
//  Copyright © 2016年 BinWu. All rights reserved.
//

#import "SettingCell.h"
#import "SettingItem.h"
#import "SettingSwitchItem.h"
#import "SettingArrowItem.h"
@interface SettingCell ()
//一直保留这个控件
@property (nonatomic, strong) UIImageView * arrowView;

@property (nonatomic, strong) UISwitch *switchView;

@end

@implementation SettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupBg];
        
        [self setupSubviews];
            }
    return self;
}
- (void)setupBg{
    //设置普通背景
    UIView *bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bg;
    //设置选中时的背景
    UIView *selectedBg = [[UIView alloc] init];
    selectedBg.backgroundColor = RGB(237, 233, 218);
    self.selectedBackgroundView = selectedBg;

}

- (void)setupSubviews{
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
}
- (UIImageView *)arrowView{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowView;
}

- (UISwitch *)switchView{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
        [_switchView addTarget:self action:@selector(switchStateChange) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}
- (void)switchStateChange{
    //存储开关状态
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.switchView.isOn forKey:self.item.title];
    [defaults synchronize];
}
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"setting";
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;

}
- (void)setItem:(SettingItem *)item{
    _item = item;
    //1.设置数据
    [self setupData];
    //2.设置右边的内容
    [self setupRightContent];
}

- (void)setupRightContent{
    if ([self.item isKindOfClass:[SettingArrowItem class]]) {
        self.accessoryView = self.arrowView;
    } else if ([self.item isKindOfClass:[SettingSwitchItem class]]){
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //设置开工状态
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.switchView.on = [defaults boolForKey:self.item.title];
    } else{
        self.accessoryView = nil;//防止循环利用cell
    }
}

- (void)setupData{
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    self.textLabel.text = self.item.title;
    self.detailTextLabel.text = self.item.subtitle;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
