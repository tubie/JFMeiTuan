//
//  JFMoreCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/30.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFMoreCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath moreArray:(NSArray *)moreArray;

@end
