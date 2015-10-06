//
//  JFMerchantAroundGroupCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/21.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFMerchantArountGroupModel;
@interface JFMerchantAroundGroupCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nowPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong)JFMerchantArountGroupModel *merchantArountGroupModel;
@end
