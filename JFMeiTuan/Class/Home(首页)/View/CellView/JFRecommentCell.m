//
//  JFRecommentCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/19.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFRecommentCell.h"
#import "JFRecommentModel.h"
@implementation JFRecommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFRecommentCell";
    JFRecommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFRecommentCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}
-(void)setRecommentModel:(JFRecommentModel *)recommentModel{
    _recommentModel = recommentModel;
//    NSURL *urlStr  = [NSURL URLWithString:recommentModel.squareimgurl];
     NSString *imageUrl = [recommentModel.squareimgurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"160.0"];
    [self.shopImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
    self.shopNameLabel.text = recommentModel.mname;
    self.shopIntroduceLabel.text = [NSString stringWithFormat:@"[%@]%@",recommentModel.range,recommentModel.title];

    self.priceLabel.text = [NSString stringWithFormat:@"%ld元", (long)recommentModel.price.integerValue ];
    self.priceLabel.textColor = navigationBarColor;
}

@end
