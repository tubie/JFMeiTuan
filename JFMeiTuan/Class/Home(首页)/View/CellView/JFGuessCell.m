//
//  JFGuessCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/19.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFGuessCell.h"

@implementation JFGuessCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellIndentifier = @"JFGuessCell";
    JFGuessCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[JFGuessCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        cell.textLabel.text = @"猜你喜欢";
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

@end
