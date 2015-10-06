//
//  JFSearchHistoryCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/22.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFSearchHistoryCell.h"


@interface JFSearchHistoryCell ()


/** 底部的线 */
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
/** 记录自己是哪个数据 */
@property (nonatomic, weak) NSIndexPath *indexPath;
/** 记录模型数据 */
@property (nonatomic, weak) NSMutableArray *hisDatas;
/** 记录tableView */
@property (nonatomic, weak) UITableView *tableView;


@end

@implementation JFSearchHistoryCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath atNSMutableArr:(NSMutableArray *)datas

{
    static NSString *identifier = @"historyCell";
    JFSearchHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject]; 
    }
    cell.tableView = tableView;
    cell.hisDatas = datas;
    cell.indexPath = indexPath;
    return cell;
}

- (IBAction)cancelSearchBtnClick:(id)sender {
    [self.hisDatas removeObjectAtIndex:self.indexPath.row];
    
    [self.hisDatas writeToFile:JFSearchHistoryPath  atomically:YES];
    
    [self.tableView deleteRowsAtIndexPaths:@[self.indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });

}
@end
