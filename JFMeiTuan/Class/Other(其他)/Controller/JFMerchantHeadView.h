//
//  JFMerchantHeadView.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/27.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFMerchantHeaderModel;

@protocol JFMerchantHeadViewRefreshDelegate <NSObject>

-(void)merchantHeadViewRefreshButtonClick;

@end
@interface JFMerchantHeadView : UIView
- (IBAction)refreshAddressBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *currentAddressLabel;

/**
 *  快速创建henderView
 *
 */
+ (instancetype)headViewWithTableView:(UITableView *)tableView;

@property(nonatomic, strong)JFMerchantHeaderModel *headModel;
@property(nonatomic, weak) id<JFMerchantHeadViewRefreshDelegate>delegate;
@end
