//
//  JFShopDetailBackAnyTimeCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/17.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFShopDatailDataModel;
@protocol JFShopDetailBackAnyTimeCellDelegate <NSObject>
@optional
-(void)shopDetailBackAnyTimeButtonClick:(UIButton *)button;

@end

@interface JFShopDetailBackAnyTimeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *backAnyTimeNumberLabel;
- (IBAction)backAnyTimeButtonClick:(id)sender;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong)JFShopDatailDataModel *detailModel;

@property(nonatomic, weak)id<JFShopDetailBackAnyTimeCellDelegate>delegate;

@end
