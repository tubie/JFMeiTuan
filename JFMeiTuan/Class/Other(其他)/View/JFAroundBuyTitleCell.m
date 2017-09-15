//
//  JFAroundBuyTitleCell.m
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
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
