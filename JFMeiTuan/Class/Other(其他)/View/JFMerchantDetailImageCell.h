//
//  JFMerchantDetailImageCell.h
//  JF团购
//
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <UIKit/UIKit.h>
@class JFMerchantDetailModel;
@interface JFMerchantDetailImageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
@property (weak, nonatomic) IBOutlet UIImageView *defaultImageView;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UIView *layoutStarView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@property(nonatomic, strong)JFMerchantDetailModel *merchantDetailModel;

@end
