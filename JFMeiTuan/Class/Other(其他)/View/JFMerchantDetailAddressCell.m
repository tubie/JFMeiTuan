//
//  JFMerchantDetailAddressCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/20.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFMerchantDetailAddressCell.h"
#import "JFMerchantDetailModel.h"
@implementation JFMerchantDetailAddressCell

- (void)awakeFromNib {
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
