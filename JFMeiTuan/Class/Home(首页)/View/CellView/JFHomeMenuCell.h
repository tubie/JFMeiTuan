//
//  JFHomeMenuCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/16.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  JFHomeMenuCellDelegate <NSObject>
@optional
-(void)homeMenuCellClick:(long)sender;

@end
@interface JFHomeMenuCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView menuArray:(NSArray *)menuArray;
@property(nonatomic, weak)id <JFHomeMenuCellDelegate >delegate;

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier menu:(NSArray *)menu;


@end
