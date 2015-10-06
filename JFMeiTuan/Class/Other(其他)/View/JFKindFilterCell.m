//
//  JFKindFilterCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/28.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFKindFilterCell.h"
#import "JFMerchantCataGroupModel.h"

@interface JFKindFilterCell ()
{
    UIImageView *_imageView;
    UILabel *_nameLabel;
    UIButton *_numberBtn;
}

@end
@implementation JFKindFilterCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView {
    //  这个 静态字符串不要与类名相同
    static NSString *KindFilterCell = @"JFKindFilterCell";
    JFKindFilterCell *cell = [tableView dequeueReusableCellWithIdentifier:KindFilterCell];
    if (cell == nil) {
        //注：这个地方要留一个心，看是调父类的还是构造方法的
        cell = [[JFKindFilterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KindFilterCell];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = RGB(239, 239, 239);
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
//withFrame:(CGRect)frame
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier  {
    
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
            

            _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 30)];
            _nameLabel.font = [UIFont systemFontOfSize:15];
            [self.contentView addSubview:_nameLabel];

            _numberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            _numberBtn.frame = CGRectMake(self.frame.size.width-85, 12, 80, 15);
            _numberBtn.titleLabel.font = [UIFont systemFontOfSize:11];
            _numberBtn.layer.cornerRadius = 7;
            _numberBtn.layer.masksToBounds = YES;
            [_numberBtn setBackgroundImage:[UIImage imageNamed:@"film"] forState:UIControlStateNormal];
            [_numberBtn setBackgroundImage:[UIImage imageNamed:@"film"] forState:UIControlStateHighlighted];
            [_numberBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_numberBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
            [self.contentView addSubview:_numberBtn];
            
            //下划线
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5)];
            lineView.backgroundColor = RGB(192, 192, 192);
            [self.contentView addSubview:lineView];
        }
        return self;

}

-(void)setMerchantCataGroupModel:(JFMerchantCataGroupModel *)merchantCataGroupModel{
    _merchantCataGroupModel = merchantCataGroupModel;
    _nameLabel.text = merchantCataGroupModel.name;
    if (merchantCataGroupModel.list == nil) {
        [_numberBtn setTitle:[NSString stringWithFormat:@"%@",merchantCataGroupModel.count] forState:UIControlStateNormal];
    }else{
        [_numberBtn setTitle:[NSString stringWithFormat:@"%@>",merchantCataGroupModel.count] forState:UIControlStateNormal];
    }
    
    NSString *str = [NSString stringWithFormat:@"%@>",merchantCataGroupModel.count];
    CGSize textSize = [str sizeWithFont:[UIFont systemFontOfSize:11] constrainedToSize:CGSizeMake(80, 15) lineBreakMode:NSLineBreakByWordWrapping];
    
    _numberBtn.frame = CGRectMake(self.frame.size.width-10-textSize.width-10, 12, textSize.width+10, 15);
}

@end
