//
//  JFRushBuyCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/19.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JFRushBuyCellDelegate   <NSObject>
@optional
-(void)didSelectAtIndexRushBuyCell:(long )index;

@end
@interface JFRushBuyCell : UITableViewCell
/**
 *  快速创建一个cell
    返回值用instancetype 代替id苹果的规范
 */
+(instancetype)cellWithTableView:(UITableView *)tableView;
/**
 *  提供一个构造实例方法方法用来给在控制器里面创建cell, 传递模型
 *
 */
-(void)setRushData:(NSMutableArray *)rushData;

@property(nonatomic ,weak)id<JFRushBuyCellDelegate>delegate;

@end
