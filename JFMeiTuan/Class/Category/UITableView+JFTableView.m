//
//  UITableView+JFTableView.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/18.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "UITableView+JFTableView.h"

@implementation UITableView (JFTableView)

+ (UITableView *)initWithTableView:(CGRect)frame withDelegate:(id)delegate
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    //将系统的Separator左边不留间隙
    tableView.separatorInset = UIEdgeInsetsZero;
    return tableView;
}

@end
