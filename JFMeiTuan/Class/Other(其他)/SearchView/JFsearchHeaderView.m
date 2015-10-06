//
//  JFsearchHeaderView.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/22.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFsearchHeaderView.h"

@implementation JFsearchHeaderView

+ (instancetype)headViewWithTableView:(UITableView *)tableView {
    static NSString *ID = @"JFsearchHeaderView";
    JFsearchHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"JFsearchHeaderView" owner:nil options:nil] lastObject];
    }
    headView.backgroundColor = separaterColor;
    return headView;
}

@end
