//
//  JFMerchantDetailAddressCell.h
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <UIKit/UIKit.h>
@class JFMerchantDetailModel;
@interface JFMerchantDetailAddressCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic, strong)JFMerchantDetailModel *merchantDetailModel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
- (IBAction)PhoneBtn:(id)sender;

@end
