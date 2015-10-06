//
//  JFMoreCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/30.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFMoreCell.h"

@implementation JFMoreCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath moreArray:(NSArray *)moreArray{
    static NSString *jfMoreCell = @"jfMoreCell";
    JFMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:jfMoreCell];
    if (cell == nil) {
        cell = [[JFMoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:jfMoreCell];
    }
  
    cell.textLabel.text = [moreArray[indexPath.section]objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;

}

@end
