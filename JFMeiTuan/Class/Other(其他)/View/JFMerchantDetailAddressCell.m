//
//  JFMerchantDetailAddressCell.m
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import "JFMerchantDetailAddressCell.h"
#import "JFMerchantDetailModel.h"
@implementation JFMerchantDetailAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFMerchantDetailAddressCell";
    JFMerchantDetailAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFMerchantDetailAddressCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)setMerchantDetailModel:(JFMerchantDetailModel *)merchantDetailModel{
    _merchantDetailModel = merchantDetailModel;
    self.addressLabel.text = merchantDetailModel.addr;
}

- (IBAction)PhoneBtn:(id)sender {
}
@end
