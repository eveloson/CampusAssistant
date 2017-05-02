//
//  TabBarViewController.m
//  Weibo
//
//  Created by BinWu on 16/6/3.
//  Copyright © 2016年 c2012y@qq.com. All rights reserved.
//

#import "TabBarViewController.h"
#import "TabBar.h"
#import "NavigationController.h"

#import "InformationViewController.h"
#import "EduAdminViewController.h"
#import "QuestionSquareTableViewController.h"
#import "SettingViewController.h"
#import "CourseViewController.h"
@interface TabBarViewController () <TabBarDelegate>
@property (nonatomic, weak) TabBar *tab;
@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化自定义tabBar
    [self setupTabBar];
    //初始化所有的子控制器
    [self setupAllChildViewControllers];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
- (void)setupTabBar{
    TabBar *tab = [[TabBar alloc] init];
    tab.frame = self.tabBar.bounds;
    tab.delegate = self;
    [self.tabBar addSubview:tab];
    self.tab = tab;
}

- (void)setupAllChildViewControllers{
    //1. 信息
    InformationViewController *information = [[InformationViewController alloc] init];
    [self setupChildViewController:information title:@"信息" imageName:@"pic_tabbar_paper" selectedImageName:nil];
    //2. 教务
    EduAdminViewController *message = [[EduAdminViewController alloc] init];
    [self setupChildViewController:message title:@"教务" imageName:@"pic_tabbar_treehole" selectedImageName:nil];
    
    //3. 课程表
    CourseViewController *classSchedule = [[CourseViewController alloc] init];
    [self setupChildViewController:classSchedule title:@"课程表" imageName:@"pic_tabbar_course" selectedImageName:nil];
    
    //4.提问广场
    QuestionSquareTableViewController *questionSquare =[[QuestionSquareTableViewController alloc] init];
    [self setupChildViewController:questionSquare title:@"问题广场" imageName:@"pic_tabbar_playground" selectedImageName:nil];

    //5. 我
    SettingViewController *setting = [[SettingViewController alloc] init];
    [self setupChildViewController:setting title:@"设置" imageName:@"pic_tabbar_setting" selectedImageName:nil];
}
/**
 *  初始化一个子控制器
 *
 *  @param childVC           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    if (selectedImageName == nil) {
        selectedImageName = [NSString stringWithFormat:@"%@_selected",imageName];
    }
    //1.设置控制器的属性
    childVC.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //2.包装一个导航控制器
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
    //3. 添加tabBar内部的按钮
    [self.tab addTabBarButtonWithItem:childVC.tabBarItem];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tabbar Delegate
/**
 *  监听tabbar的按钮改变事件
 */
- (void)tabBar:(TabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to{
    self.selectedIndex = to;
}

- (void)tabBarDidClickedPlusButton{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor blueColor];
    [self presentViewController:vc animated:YES completion:nil];
}



@end
