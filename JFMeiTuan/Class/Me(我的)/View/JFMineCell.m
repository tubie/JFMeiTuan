//
//  JFMineCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/29.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFMineCell.h"
#import "JFMineModel.h"

@interface JFMineCell ()

@end

@implementation JFMineCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView mineModel:(JFMineModel*)mineModel{
    static NSString *jfmineCell = @"jfmineCell";
    JFMineCell *cell = [tableView dequeueReusableCellWithIdentifier:jfmineCell];
    if (cell == nil) {
        cell = [[JFMineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:jfmineCell];
    }
    NSString *imageStr = [NSString stringWithFormat:@"%@", mineModel.imageName];
    cell.imageView.image = [UIImage imageNamed:imageStr];
    cell.textLabel.text = mineModel.title;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
    
}


@end
