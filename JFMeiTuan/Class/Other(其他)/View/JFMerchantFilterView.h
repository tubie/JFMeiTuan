//
//  JFMerchantFilterView.h
//  JF团购
//
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <UIKit/UIKit.h>

@protocol JFMerchantFilterViewDelegate <NSObject>

@optional
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath withId:(NSNumber *)ID ;

@end
@interface JFMerchantFilterView : UIView

/**
 *  全部分类的tableView
 */
@property(nonatomic, strong) UITableView *tableViewOfGroup;

/**
 *  每组详情的tableView
 */
@property(nonatomic, strong) UITableView *tableViewOfDetail;

@property (nonatomic, weak) id <JFMerchantFilterViewDelegate> delegate;


@end
