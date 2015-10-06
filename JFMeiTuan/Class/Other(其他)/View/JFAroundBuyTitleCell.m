//
//  JFAroundBuyTitleCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/20.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFAroundBuyTitleCell.h"

@implementation JFAroundBuyTitleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *jfMineBigTitleCell = @"JFAroundBuyTitleCell";
    JFAroundBuyTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:jfMineBigTitleCell];
    if (cell == nil) {
        cell = [[JFAroundBuyTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:jfMineBigTitleCell];
    }
    
    cell.textLabel.text = @"附近团购";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


@end
