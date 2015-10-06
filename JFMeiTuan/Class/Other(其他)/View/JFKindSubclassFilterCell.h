//
//  JFKindSubclassFilterCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/28.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFMerchantCataGroupModel;
@interface JFKindSubclassFilterCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath model:(JFMerchantCataGroupModel *)model;

@end
