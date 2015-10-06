//
//  JFKindFilterCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/28.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFMerchantCataGroupModel;
@interface JFKindFilterCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView ;


@property (nonatomic, strong)JFMerchantCataGroupModel *merchantCataGroupModel;

@end
