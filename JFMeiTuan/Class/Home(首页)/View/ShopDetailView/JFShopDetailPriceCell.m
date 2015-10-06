//
//  JFShopDetailPriceCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/17.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFShopDetailPriceCell.h"
#import "JFShopDatailDataModel.h"
@implementation JFShopDetailPriceCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFShopDetailPriceCell";
    JFShopDetailPriceCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFShopDetailPriceCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setDetailModel:(JFShopDatailDataModel *)detailModel{
    _detailModel = detailModel;

    self.nowPriceLabel.text = [NSString stringWithFormat:@"%@元",[detailModel.price stringValue]];
    self.nowPriceLabel.textColor = navigationBarColor;
    
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};

    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%.2f元",[detailModel.value doubleValue]] attributes:attribtDic];
    self.OldPriceLabel.attributedText = attribtStr;

}

- (IBAction)rushBuyButtonClick:(id)sender {
}


@end
