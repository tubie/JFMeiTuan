//
//  JFMerchantFilterView.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/28.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JFMerchantFilterViewDelegate <NSObject>

@optional
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath withId:(NSNumber *)ID ;

@end
@interface JFMerchantFilterView : UIView

/**
 *  全部分类的tableView
 */
@property(nonatomic, strong) UITableView *tableViewOfGroup;

/**
 *  每组详情的tableView
 */
@property(nonatomic, strong) UITableView *tableViewOfDetail;

@property (nonatomic, weak) id <JFMerchantFilterViewDelegate> delegate;


@end
