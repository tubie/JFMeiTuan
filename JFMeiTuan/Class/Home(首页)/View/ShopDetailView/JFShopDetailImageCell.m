//
//  JFShopDetailImageCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/17.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFShopDetailImageCell.h"
#import "JFShopDatailDataModel.h"
@implementation JFShopDetailImageCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFShopDetailImageCell";
    JFShopDetailImageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFShopDetailImageCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)setDetailModel:(JFShopDatailDataModel *)detailModel{
    _detailModel = detailModel;
    NSString *imgUrl = [detailModel.imgurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"300.0"];
    //                NSLog(@"店铺图片：%@  %@",imgUrl, _shopInfoM.imgurl);
//    [cell.shopImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"]];

    [self.shopDetailImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
    self.shopNameLabel.text = detailModel.mname;
    self.introduceLabel.text = detailModel.title;
}
@end
