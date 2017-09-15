//
//  JFMineCell.h
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <UIKit/UIKit.h>
@class JFMineModel;
@interface JFMineCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView mineModel:(JFMineModel*)mineModel;

@end
