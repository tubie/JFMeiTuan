//
//  JFDiscountCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/19.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JFDiscountCellDelegate <NSObject>

-(void)didSelectAtIndexDiscountCell:(NSString *)urlStr;

@end
@interface JFDiscountCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic, strong) NSMutableArray *discountArray;

@property(nonatomic, weak)id<JFDiscountCellDelegate>delegate;


@end
