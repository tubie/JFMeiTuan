//
//  JFTabBarViewController.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/11.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFTabBarViewController.h"
#import "JFNavigationController.h"
#import "JFTabBar.h"
#import "ViewController.h"
#import "JFMineViewController.h"
#import "JFMoreViewController.h"
#import "JFMerchantViewController.h"
#import "JFVisitViewController.h"

@interface JFTabBarViewController ()<tabbarDelegate>

@property(nonatomic ,strong)JFTabBar *costomTabBar;

@end

@implementation JFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化tabbar
    [self setUpTabBar];

    //添加子控制器
    [self setUpAllChildViewController];
}

//取出系统自带的tabbar并把里面的按钮删除掉
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    for ( UIView * child in  self.tabBar.subviews) {
        
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

-(void)setUpTabBar{
    JFTabBar *customTabBar = [[JFTabBar alloc]init];
    customTabBar.delegate = self;
//    customTabBar.backgroundColor = [UIColor redColor];
    customTabBar.frame = self.tabBar.bounds;
    self.costomTabBar = customTabBar;
    [self.tabBar addSubview:customTabBar];
    
}
-(void)tabBar:(JFTabBar *)tabBar didselectedButtonFrom:(int)from to:(int)to{
    NSLog(@"%d, %d", from, to);
    self.selectedIndex = to;
    NSLog(@"%lu", (unsigned long)self.selectedIndex);
    
}

-(void)setUpAllChildViewController{
    ViewController *homeVC = [[ViewController alloc]init];
    [self setupChildViewController:homeVC title:@"首页" imageName:@"icon_tabbar_homepage" seleceImageName:@"icon_tabbar_homepage_selected"];
    
    JFVisitViewController *visitVC = [[JFVisitViewController alloc]init];
    [self setupChildViewController:visitVC title:@"上门" imageName:@"icon_tabbar_onsite" seleceImageName:@"icon_tabbar_onsite_selected"];
    
    JFMerchantViewController *merchantVC = [[JFMerchantViewController alloc]init];
    [self setupChildViewController:merchantVC title:@"商家" imageName:@"icon_tabbar_merchant_normal" seleceImageName:@"icon_tabbar_merchant_normal_selected"];
    
    JFMineViewController *mineVC = [[JFMineViewController alloc]init];
    [self setupChildViewController:mineVC title:@"我的" imageName:@"icon_tabbar_mine" seleceImageName:@"icon_tabbar_mine_selected"];
    
    JFMoreViewController *moreVC = [[JFMoreViewController alloc]init];
    [self setupChildViewController:moreVC title:@"更多" imageName:@"icon_tabbar_misc" seleceImageName:@"icon_tabbar_misc_selected"];
    
}

-(void)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName{
//    controller.title = title;
    controller.tabBarItem.title = title;//跟上面一样效果
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    
    //包装导航控制器
    JFNavigationController *nav = [[JFNavigationController alloc]initWithRootViewController:controller];
    //UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:nav];
    
    [self.costomTabBar addTabBarButtonWithItem:controller.tabBarItem];
    
}




@end
