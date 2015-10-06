//
//  JFHomeServiceCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/24.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JFHomeServiceCellDelegate <NSObject>
@optional
-(void)homeServiceCellTapClick:(long )index;

@end

@interface JFHomeServiceCell : UITableViewCell

@property(nonatomic, weak)id <JFHomeServiceCellDelegate>delegate;
@property(nonatomic, strong) NSMutableArray *homeServiceArray;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
