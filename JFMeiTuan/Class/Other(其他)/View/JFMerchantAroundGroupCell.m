//
//  JFMerchantAroundGroupCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/21.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFMerchantAroundGroupCell.h"
#import "JFMerchantArountGroupModel.h"
@implementation JFMerchantAroundGroupCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFMerchantAroundGroupCell";
    JFMerchantAroundGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFMerchantAroundGroupCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)setMerchantArountGroupModel:(JFMerchantArountGroupModel *)merchantArountGroupModel{
    _merchantArountGroupModel = merchantArountGroupModel;
    
    NSString *imgUrl = [merchantArountGroupModel.squareimgurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"160.160"];
    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
    
    //
    self.productNameLabel.text = merchantArountGroupModel.mname;
    self.introduceLabel.text = [NSString stringWithFormat:@"[%@]%@",merchantArountGroupModel.range,merchantArountGroupModel.title];
    //
    NSString *str = [NSString stringWithFormat:@"%@元",merchantArountGroupModel.price];
    //CGSize labelSize = [str boundingRectWithSize:CGSizeMake(100, 20) withFont:17];
    _nowPriceLabel.text = str;
    [_nowPriceLabel setTextColor:navigationBarColor];
    //_nowPriceLabel.frame = CGRectMake(100, 70, labelSize.width, labelSize.height);
    //
    NSString *strOld = [NSString stringWithFormat:@"%@元",merchantArountGroupModel.value];
    
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    //下划线
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:strOld attributes:attribtDic];
    _oldPriceLabel.attributedText = attribtStr;
    _oldPriceLabel.frame = CGRectMake(CGRectGetMaxX(_nowPriceLabel.frame)+5, 70, 100, 20);

}

@end
