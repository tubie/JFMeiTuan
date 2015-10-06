//
//  JFHomeServiceCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/24.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFHomeServiceCell.h"
#import "JFHomeServiceModel.h"
#import "NSString+JFColorString.h"

@implementation JFHomeServiceCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellIndentifier = @"nomorecell";
    JFHomeServiceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[JFHomeServiceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initViews];
    }
    return self;

}
/**
 *  初始化一个cell里面的所有内容
 */
-(void)initViews{
    for (int i = 0; i < 10; ++i) {
        
        int x = i%2;
        int y = i/2;
        //背景
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(x*(SCREENWIDTH-15)/2+5*(x+1), y*125+5, (SCREENWIDTH-15)/2, 120)];
        backView.backgroundColor = [UIColor redColor];
        backView.tag = 10+i;
        backView.hidden = YES;
        [self addSubview:backView];
        //
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBackView:)];
        [backView addGestureRecognizer:tap];
        
        //图
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, backView.frame.size.width, backView.frame.size.height-40)];
        imageView.tag = 50+i;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [backView addSubview:imageView];
        
        //标题
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), backView.frame.size.width, 30)];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.text = @"我是标题";
        titleLabel.tag = 100+i;
        [backView addSubview:titleLabel];
    }


}

-(void)setHomeServiceArray:(NSMutableArray *)homeServiceArray{
    _homeServiceArray = homeServiceArray;
    for (int i = 0; i < homeServiceArray.count; i++) {
        UIView *backView = [self viewWithTag:10+i];
        backView.hidden = NO;
        JFHomeServiceModel *homeM = homeServiceArray[i];
        backView.backgroundColor = [homeM.background stringTOColor:homeM.background] ;
        //
        UIImageView *imageView = (UIImageView *)[self viewWithTag:50+i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:homeM.cateImgUrl] placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
        
        //
        UILabel *titleLabel = (UILabel *)[self viewWithTag:100+i];
        titleLabel.text = homeM.cateName;
        
    }
}

-(void)OnTapBackView:(UITapGestureRecognizer *)sender{
    JFLog(@"%ld", (long)sender.view.tag);
    if ([self.delegate respondsToSelector:@selector(homeServiceCellTapClick:)]) {
        [self.delegate homeServiceCellTapClick:sender.view.tag];
    }
}

@end
