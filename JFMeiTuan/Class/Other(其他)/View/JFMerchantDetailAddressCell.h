//
//  JFMerchantDetailAddressCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/20.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFMerchantDetailModel;
@interface JFMerchantDetailAddressCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic, strong)JFMerchantDetailModel *merchantDetailModel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
- (IBAction)PhoneBtn:(id)sender;

@end
