//
//  JFImageScrollCell.h
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <UIKit/UIKit.h>
@class JFImageScrollView;


@interface JFImageScrollCell : UITableViewCell

@property (nonatomic, strong)JFImageScrollView *imageScrollView;
@property(nonatomic, strong) NSArray *imageArr;


-(void)setImageArray:(NSArray *)imageArray;

//+ (instancetype)cellWithTableView:(UITableView *)tableView;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame;
@end
