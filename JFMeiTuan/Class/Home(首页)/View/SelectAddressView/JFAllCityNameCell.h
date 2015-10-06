//
//  JFAllCityNameCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/14.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFAllCityNameCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath keys:(NSMutableArray *)keys cities:(NSMutableDictionary *)cities;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellForRowAtIndexPath:(NSIndexPath *)indexPath keys:(NSMutableArray *)keys cities:(NSMutableDictionary *)cities;

@end
