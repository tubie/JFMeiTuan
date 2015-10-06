//
//  JFHotQueueCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/19.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFHotQueueCell.h"
#import "JFHotQueueModel.h"

@implementation JFHotQueueCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"hotqueue";
    JFHotQueueCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFHotQueueCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

-(void)setHotQueueModel:(JFHotQueueModel *)hotQueueModel{
    _hotQueueModel = hotQueueModel;
    
    NSURL *urlStr = [NSURL URLWithString:hotQueueModel.imageUrl];
    [self.hotQueueImageView sd_setImageWithURL:urlStr  placeholderImage:nil];
    self.mianLabel.text = hotQueueModel.title;
    self.subtitleLabel.text = hotQueueModel.comment;
}
@end
