//
//  JFHotCityNameCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/14.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFHotCityNameCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView hotCityArray:(NSArray *)hotCityArray;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier hotCityArray:(NSArray *)hotCityArray;
@end
