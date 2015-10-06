//
//  JFShopDetailBackAnyTimeCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/17.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFShopDetailBackAnyTimeCell.h"
#import "JFShopDatailDataModel.h"
@implementation JFShopDetailBackAnyTimeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFShopDetailBackAnyTimeCell";
    JFShopDetailBackAnyTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell已售
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFShopDetailBackAnyTimeCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setDetailModel:(JFShopDatailDataModel *)detailModel{
    _detailModel = detailModel;
    
    self.backAnyTimeNumberLabel.text = [NSString stringWithFormat:@"已售%@",[detailModel.solds stringValue]];
}


- (IBAction)backAnyTimeButtonClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(shopDetailBackAnyTimeButtonClick:)]) {
        [self.delegate shopDetailBackAnyTimeButtonClick:sender];
    }
}
@end
