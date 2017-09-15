//
//  JFKindSubclassFilterCell.h
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <UIKit/UIKit.h>
@class JFMerchantCataGroupModel;
@interface JFKindSubclassFilterCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath model:(JFMerchantCataGroupModel *)model;

@end
