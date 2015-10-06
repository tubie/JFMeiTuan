//
//  JFImageScrollCell.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/22.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFImageScrollView;


@interface JFImageScrollCell : UITableViewCell

@property (nonatomic, strong)JFImageScrollView *imageScrollView;
@property(nonatomic, strong) NSArray *imageArr;


-(void)setImageArray:(NSArray *)imageArray;

//+ (instancetype)cellWithTableView:(UITableView *)tableView;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame;
@end
