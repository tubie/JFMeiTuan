//
//  JFsearchHeaderView.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/22.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFsearchHeaderView : UIView

+ (instancetype)headViewWithTableView:(UITableView *)tableView ;

@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;


@end
