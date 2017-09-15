//
//  JFKindFilterCell.h
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <UIKit/UIKit.h>
@class JFMerchantCataGroupModel;
@interface JFKindFilterCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView ;


@property (nonatomic, strong)JFMerchantCataGroupModel *merchantCataGroupModel;

@end
