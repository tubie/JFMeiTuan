//
//  JFMerchantAroundGroupCell.h
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <UIKit/UIKit.h>
@class JFMerchantArountGroupModel;
@interface JFMerchantAroundGroupCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nowPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong)JFMerchantArountGroupModel *merchantArountGroupModel;
@end
