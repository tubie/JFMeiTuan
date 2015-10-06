//
//  UITableView+JFTableView.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/18.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (JFTableView)
/**
 *  快速创建tableView
 *
 *  @param frame    tableView的frame
 *  @param delegate 代理
 *
 *  @return 返回一个自定义的tableView
 */
+ (UITableView *)initWithTableView:(CGRect)frame withDelegate:(id)delegate;
@end
