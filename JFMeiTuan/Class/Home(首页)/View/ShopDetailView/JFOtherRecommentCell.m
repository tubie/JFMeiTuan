//
//  JFOtherRecommentCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/17.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFOtherRecommentCell.h"
#import "JFShopRecommentModel.h"
@implementation JFOtherRecommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFOtherRecommentCell";
    JFOtherRecommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFOtherRecommentCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
-(void)setShopRecommentModel:(JFShopRecommentModel *)shopRecommentModel{
    _shopRecommentModel = shopRecommentModel;
    
    NSString *imgUrl = [shopRecommentModel.imgurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"160.0"];
    [self.shopImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
    
    self.productNameLabel.text = shopRecommentModel.brandname;
    self.introduceLabel.text = [NSString stringWithFormat:@"[%@]%@",shopRecommentModel.range,shopRecommentModel.title];
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f元",[shopRecommentModel.price doubleValue]];
    self.priceLabel.textColor = navigationBarColor;

}
@end
