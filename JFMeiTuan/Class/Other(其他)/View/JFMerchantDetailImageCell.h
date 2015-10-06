//
//  JFMerchantDetailImageCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/20.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFMerchantDetailModel;
@interface JFMerchantDetailImageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
@property (weak, nonatomic) IBOutlet UIImageView *defaultImageView;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UIView *layoutStarView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@property(nonatomic, strong)JFMerchantDetailModel *merchantDetailModel;

@end
