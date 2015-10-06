//
//  JFCityTitleHeaderView.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/14.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFCityTitleHeaderView.h"

@implementation JFCityTitleHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)headViewWithTableView:(UITableView *)tableView {
    static NSString *ID = @"JFCityTitleHeaderView";
    JFCityTitleHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"JFCityTitleHeaderView" owner:nil options:nil] lastObject];
    }
    headView.backgroundColor = separaterColor;
    
    return headView;
}

-(void)setKeyStr:(NSString *)keyStr{
    _keyStr = keyStr;
    self.titleLabel.text = keyStr;
}

@end
