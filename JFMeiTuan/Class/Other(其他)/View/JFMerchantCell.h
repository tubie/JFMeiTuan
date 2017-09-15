//
//  JFMerchantCell.h
///  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <UIKit/UIKit.h>
@class JFMerchantModel;

@interface JFMerchantCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *layoutStatView;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UILabel *commentNuuberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong)JFMerchantModel *merchantModel;

@end
