//
//  JFMerchantHeadView.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/27.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFMerchantHeadView.h"
#import "JFMerchantHeaderModel.h"

@implementation JFMerchantHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*
 - (id)dequeueReusableCellWithIdentifier:(NSString *)identifier;  
 // Used by the delegate to acquire an already allocated cell, in lieu of allocating a new one.
 
 - (id)dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0); 
 // newer dequeue method guarantees a cell is returned and resized properly, assuming identifier is registered
 
    tableView的headView重用标识。像cell的重用。
 - (id)dequeueReusableHeaderFooterViewWithIdentifier:(NSString *)identifier NS_AVAILABLE_IOS(6_0); 
 // like dequeueReusableCellWithIdentifier:, but for headers/footers

 */

+ (instancetype)headViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFMerchantHeadView";
    JFMerchantHeadView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"JFMerchantHeadView" owner:nil options:nil] lastObject];
    }
    headView.backgroundColor = RGB(192, 192, 192);
    return headView;
}

-(void)setHeadModel:(JFMerchantHeaderModel *)headModel{
    _headModel = headModel;
    self.currentAddressLabel.text = [NSString stringWithFormat:@"当前位置:%@,%@",headModel.province,headModel.detail];
}
- (IBAction)refreshAddressBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(merchantHeadViewRefreshButtonClick)]) {
        [self.delegate merchantHeadViewRefreshButtonClick];
    }
    
}
@end
