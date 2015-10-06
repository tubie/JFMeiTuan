//
//  JFMineHeaderView.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/29.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFMineHeaderView.h"

@implementation JFMineHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)headViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFMineHeaderView";
    JFMineHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"JFMineHeaderView" owner:nil options:nil] lastObject];
        
        headView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_login"]];
    }
    
    return headView;
}


@end
