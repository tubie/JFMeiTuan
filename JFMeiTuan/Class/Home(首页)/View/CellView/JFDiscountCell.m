//
//  JFDiscountCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/19.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFDiscountCell.h"
#import "JFDiscountModel.h"
@implementation JFDiscountCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellIndentifier = @"nomorecell";
    JFDiscountCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[JFDiscountCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        for (int i = 0; i < 4; i++) {
            //背景  这个可以进行重构。不要一行一行创建
            UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(i*SCREENWIDTH/2, 0, SCREENWIDTH/2, 80)];
            if (i<2) {
                backView.frame = CGRectMake(i*SCREENWIDTH/2, 0, SCREENWIDTH/2, 80);
            }else{
                backView.frame = CGRectMake((i-2)*SCREENWIDTH/2, 80, SCREENWIDTH/2, 80);
            }
            backView.tag = 100+i;
            backView.layer.borderWidth = 0.25;
            backView.layer.borderColor = [separaterColor CGColor];

            //点击事件
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBackView:)];
            [backView addGestureRecognizer:tap];
            
            //标题
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, SCREENWIDTH/2-10-60, 30)];
            titleLabel.text = @"暑期看大片";
            titleLabel.tag = 200+i;
            titleLabel.font = [UIFont boldSystemFontOfSize:17];
            [backView addSubview:titleLabel];
            
            //子标题
            UILabel *subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, SCREENWIDTH/2-10-60, 30)];
            subTitleLabel.tag = 220+i;
            subTitleLabel.font = [UIFont systemFontOfSize:12];
            subTitleLabel.text = @"上门服务限时抢";
            [backView addSubview:subTitleLabel];
            
            //图
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREENWIDTH/2-10-60, 10, 60, 60)];
            imageView.tag = 240+i;
            [imageView setImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
            imageView.layer.masksToBounds = YES;
            imageView.layer.cornerRadius = 30;
            [backView addSubview:imageView];

            [self addSubview:backView];
            
        }
        
        
    }
    return self;
}
/**
 *  重写set方法。可变数组里面都是模型
    作用：1.传递模型
         2.给控件赋值
 */
-(void)setDiscountArray:(NSMutableArray *)discountArray{
    _discountArray = discountArray;
    for (int j = 0; j < 4; ++j) {
        UILabel *titleLabel = (UILabel *)[self viewWithTag:j+200];
        UILabel *subtitleLabel = (UILabel *)[self viewWithTag:j+220];
        UIImageView *imageView = (UIImageView *)[self viewWithTag:j+240];
        JFDiscountModel *discount = discountArray[j];
        
        titleLabel.text = discount.maintitle;
        titleLabel.textColor = [self stringTOColor:discount.typeface_color];
        subtitleLabel.text = discount.deputytitle;
        
        NSString *imageUrl = [discount.imageurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"120.0"];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
    }


}
- (UIColor *) stringTOColor:(NSString *)str
{
    if (!str || [str isEqualToString:@""]) {
        return nil;
    }
    unsigned red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 1;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&blue];
    UIColor *color= [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
    return color;
}

-(void)OnTapBackView:(UITapGestureRecognizer *)sender{
    NSInteger index = sender.view.tag-100;
    NSString *str = @"";

    JFDiscountModel *discountModel = _discountArray[index];
    str = discountModel.tplurl;
    NSRange rang = [str rangeOfString:@"http"];
     str = [str substringFromIndex:rang.location];

    if ([self.delegate respondsToSelector:@selector(didSelectAtIndexDiscountCell:)]) {
        [self.delegate didSelectAtIndexDiscountCell:str];
    }
   
    
}


@end
