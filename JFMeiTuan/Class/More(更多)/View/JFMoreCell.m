//
//  JFMoreCell.m
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import "JFMoreCell.h"

@implementation JFMoreCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];

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
