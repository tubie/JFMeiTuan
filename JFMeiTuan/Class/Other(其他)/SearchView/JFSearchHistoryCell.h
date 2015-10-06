//
//  JFSearchHistoryCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/22.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface JFSearchHistoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *searchHistoryLabel;
- (IBAction)cancelSearchBtnClick:(id)sender;

+ (instancetype)cellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath atNSMutableArr:(NSMutableArray *)datas;


@end
