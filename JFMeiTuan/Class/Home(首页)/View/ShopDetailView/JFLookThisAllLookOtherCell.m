//
//  JFLookThisAllLookOtherCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/17.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFLookThisAllLookOtherCell.h"

@implementation JFLookThisAllLookOtherCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellIndentifier = @"JFLookThisAllLookOtherCell";
    JFLookThisAllLookOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[JFLookThisAllLookOtherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        cell.textLabel.text = @"看了本团购的用户还看了";
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

@end
