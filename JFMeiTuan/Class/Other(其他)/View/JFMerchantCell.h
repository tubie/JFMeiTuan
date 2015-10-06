//
//  JFMerchantCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/27.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFMerchantModel;

@interface JFMerchantCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *layoutStatView;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UILabel *commentNuuberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong)JFMerchantModel *merchantModel;

@end
