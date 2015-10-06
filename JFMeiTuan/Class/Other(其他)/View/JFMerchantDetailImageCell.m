//
//  JFMerchantDetailImageCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/20.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFMerchantDetailImageCell.h"
#import "JFMerchantDetailModel.h"
@implementation JFMerchantDetailImageCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFMerchantDetailImageCell";
    JFMerchantDetailImageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFMerchantDetailImageCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(void)setMerchantDetailModel:(JFMerchantDetailModel *)merchantDetailModel{
    _merchantDetailModel = merchantDetailModel;
    NSURL *url = [NSURL URLWithString:[merchantDetailModel.frontImg stringByReplacingOccurrencesOfString:@"w.h" withString:@"300.200"]];
    
    [self.shopImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"] ];
    self.introduceLabel.text = merchantDetailModel.name;
    self.priceLabel.text = [merchantDetailModel.avgPrice stringValue];
    
    double scoreD = [merchantDetailModel.avgScore doubleValue];
    int scoreI = ceil(scoreD);
    
    //把五个星星看作一个整体，通过一个for循环创建。在这里创建不好业务不分明
    for (int i = 0; i < 5; i++) {
        UIImageView *starImg = [[UIImageView alloc] initWithFrame:CGRectMake(i * 12, 0, 12, 12)];
        starImg.tag = 30+i;
        [starImg setImage:[UIImage imageNamed:@"icon_feedCell_star_empty"]];
        [self.layoutStarView addSubview:starImg];
    }
    
    
    for (int i = 0; i < scoreI; i++) {
        UIImageView *imageview = (UIImageView *)[self.contentView viewWithTag:30+i];
        [imageview setImage:[UIImage imageNamed:@"icon_feedCell_star_full"]];
    }


}


@end
