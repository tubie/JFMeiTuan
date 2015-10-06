//
//  JFSearchHotCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/22.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFSearchHotCell.h"

@interface JFSearchHotCell ()

@property(nonatomic, strong)UIButton *button;
@property (nonatomic , strong)NSArray *hotDatas;
@property(nonatomic, strong) NSIndexPath *indexPath;

@end
@implementation JFSearchHotCell

- (void)awakeFromNib {
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView 
{
    static NSString *ID = @"JFSearchHotCell";
    JFSearchHotCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFSearchHotCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.hotDatas =hotDatas;
//    cell.indexPath = indexPath;
//    [cell.button setTitle:buttontitle forState:UIControlStateNormal] ;
    return cell;
}
-(void)setArray:(NSArray *)array{
    _array = array;
    NSInteger buttons = array.count;
    CGFloat margin = 10;
    CGFloat buttonW = (SCREENWIDTH - (buttons +1 ) * margin)/buttons;
    for (int i = 0 ; i < array.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button = button;
        button.frame = CGRectMake( margin + i * (buttonW +margin) , 5, buttonW   , 40);
        NSString *buttontitle = array[i];
        
        [button setTitle:buttontitle forState:UIControlStateNormal];
        button.backgroundColor = navigationBarColor;
        [self addSubview:button];
    }

}

@end
