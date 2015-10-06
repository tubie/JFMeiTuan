//
//  JFMineCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/29.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFMineModel;
@interface JFMineCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView mineModel:(JFMineModel*)mineModel;

@end
