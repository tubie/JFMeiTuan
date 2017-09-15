//
//  JFMineBigTitleCell.m
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import "JFMineBigTitleCell.h"

@implementation JFMineBigTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];

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
