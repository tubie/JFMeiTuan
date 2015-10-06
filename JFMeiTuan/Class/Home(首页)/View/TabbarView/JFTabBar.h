//
//  JFTabBar.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/11.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFTabBarButton.h"

@class JFTabBar;

//给每个按钮定义协议 与 方法
@protocol tabbarDelegate <NSObject>
@optional
-(void)tabBar:(JFTabBar * )tabBar didselectedButtonFrom:(int)from to:(int)to;
@end

@interface JFTabBar : UIView
@property (weak ,nonatomic)JFTabBarButton *selectedButton;
/**
 *  给自定义的tabbar添加按钮
 */
-(void)addTabBarButtonWithItem:(UITabBarItem *)itme;
@property(nonatomic , weak) id <tabbarDelegate> delegate;



@end
