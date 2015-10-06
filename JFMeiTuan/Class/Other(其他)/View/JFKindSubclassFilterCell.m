//
//  JFKindSubclassFilterCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/28.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFKindSubclassFilterCell.h"
#import "JFMerchantCataGroupModel.h"

@interface JFKindSubclassFilterCell ()


@end

@implementation JFKindSubclassFilterCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath model:(JFMerchantCataGroupModel *)model{
    static NSString *kindSubclassFilter = @"JFKindSubclassFilterCell";
    JFKindSubclassFilterCell *cell = [tableView dequeueReusableCellWithIdentifier:kindSubclassFilter];
    if (cell == nil) {
        cell = [[JFKindSubclassFilterCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kindSubclassFilter];
    }
    
    
    /*用这个方法给子分类 赋值的话 不能识别是哪一行的 所以用传NSIndexPath
     for (NSDictionary  *dict  in  model.list) {
     cell.textLabel.text = dict [@"name"];
     cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", dict [@"count"]];
     }
     */
    
    cell.textLabel.text = [model.list [indexPath.row] objectForKey:@"name"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [model.list [indexPath.row] objectForKey:@"count"]];

    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:11];
    cell.backgroundColor = RGB(242, 242, 242);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
@end
