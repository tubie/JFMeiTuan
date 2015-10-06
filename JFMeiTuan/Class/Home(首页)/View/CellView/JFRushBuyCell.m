//
//  JFRushBuyCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/19.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFRushBuyCell.h"
#import "JFRushDataModel.h"
#import "JFRushDealsModel.h"


@implementation JFRushBuyCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellIndentifier = @"nomorecell";
    JFRushBuyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[JFRushBuyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        for (int i = 0; i < 3; ++i) {
            //背景view
            
           
            
            //1.创建三个backView 用来装产品imageView 和 价格label
            UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(i*SCREENWIDTH/3, 40, (SCREENWIDTH-3)/3, 80)];
            backView.tag = 100+i;
            
             UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBackView:)];
            [backView addGestureRecognizer:tap];
            [self addSubview:backView];
            
            //因为是加在backView 所以不用再用i来控制X
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (SCREENWIDTH-3)/3, 50)];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            imageView.tag = i+20;
            [backView addSubview:imageView];
            
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(i*SCREENWIDTH/3-1, 45, 0.5, 65)];
            lineView.backgroundColor = RGB(200, 199, 204);
            [self addSubview:lineView];
            
            //最新优惠的价格
            UILabel *newPrice = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, backView.frame.size.width/2, 30)];
            newPrice.tag = 50+i;
            newPrice.textColor = RGB(245, 185, 98);
            newPrice.textAlignment = NSTextAlignmentRight;
            [backView addSubview:newPrice];

            //原来的价格
            UILabel *oldPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(backView.frame.size.width/2+5, 50, backView.frame.size.width/2-5, 30)];
            oldPriceLabel.tag = 70+i;
            oldPriceLabel.textColor = navigationBarColor;
            oldPriceLabel.font = [UIFont systemFontOfSize:13];
            [backView addSubview:oldPriceLabel];
            
            
            //名店抢购图
            UIImageView *mingdian = [[UIImageView alloc] initWithFrame:CGRectMake(20, 7, 78, 25)];
            [mingdian setImage:[UIImage imageNamed:@"todaySpecialHeaderTitleImage"]];
            [self addSubview:mingdian];
            
        }

        
    }
    return self;
}

-(void)setRushData:(NSMutableArray *)rushData{
    for (int i = 0; i < 3; i++) {
        JFRushDealsModel *rush = rushData[i];
        NSString *imageUrl = rush.mdcLogoUrl;
        NSInteger newPrice = [rush.campaignprice integerValue];
        NSInteger oldPrice = [rush.price integerValue];
        
        UIImageView *imageView = (UIImageView *)[self viewWithTag:20+i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
        
        UILabel *newPriceLabel = (UILabel *)[self viewWithTag:50+i];
        newPriceLabel.text = [NSString stringWithFormat:@"%ld元",newPrice];
       
        
        UILabel *oldPriceLabel = (UILabel *)[self viewWithTag:70+i];
        NSString *oldStr = [NSString stringWithFormat:@"%ld元",oldPrice];
        
        //显示下划线
        //中划线
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        
        //下划线
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:oldStr attributes:attribtDic];
        oldPriceLabel.attributedText = attribtStr;
        
    }
}

-(void)OnTapBackView:(UITapGestureRecognizer *)sender{
    NSLog(@"tag:%ld",sender.view.tag);
    
    if ([self.delegate respondsToSelector:@selector(didSelectAtIndexRushBuyCell:)]) {
        [self.delegate didSelectAtIndexRushBuyCell:sender.view.tag -100];
    }
}


@end
