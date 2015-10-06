//
//  JFShopDetailPriceCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/17.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFShopDatailDataModel;
@interface JFShopDetailPriceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nowPriceLabel;

@property (weak, nonatomic) IBOutlet UILabel *OldPriceLabel;
- (IBAction)rushBuyButtonClick:(id)sender;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@property(nonatomic, strong)JFShopDatailDataModel *detailModel;

@end
