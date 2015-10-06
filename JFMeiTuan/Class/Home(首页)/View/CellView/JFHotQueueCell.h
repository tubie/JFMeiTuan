//
//  JFHotQueueCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/19.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFHotQueueModel;
@interface JFHotQueueCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *hotQueueImageView;
@property (weak, nonatomic) IBOutlet UILabel *mianLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@property (nonatomic, strong)JFHotQueueModel *hotQueueModel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
