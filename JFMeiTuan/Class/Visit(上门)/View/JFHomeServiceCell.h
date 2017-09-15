//
//  JFHomeServiceCell.h
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <UIKit/UIKit.h>

@protocol JFHomeServiceCellDelegate <NSObject>
@optional
-(void)homeServiceCellTapClick:(long )index;

@end

@interface JFHomeServiceCell : UITableViewCell

@property(nonatomic, weak)id <JFHomeServiceCellDelegate>delegate;
@property(nonatomic, strong) NSMutableArray *homeServiceArray;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
