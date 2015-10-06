//
//  JFMineBigTitleCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/29.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFMineBigTitleCell.h"

@implementation JFMineBigTitleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *jfMineBigTitleCell = @"jfmineCell";
    JFMineBigTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:jfMineBigTitleCell];
    if (cell == nil) {
        cell = [[JFMineBigTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:jfMineBigTitleCell];
    }
   
    cell.textLabel.text = @"土鳖不土";
//    cell.backgroundColor =[UIColor redColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

@end
