//
//  JFCityTitleHeaderView.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/14.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFCityTitleHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property(nonatomic, copy)NSString *keyStr;
+ (instancetype)headViewWithTableView:(UITableView *)tableView ;
@end
