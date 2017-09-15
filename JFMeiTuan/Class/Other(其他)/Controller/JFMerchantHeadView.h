//
//  JFMerchantHeadView.h
//  JF团购
//
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <UIKit/UIKit.h>
@class JFMerchantHeaderModel;

@protocol JFMerchantHeadViewRefreshDelegate <NSObject>

-(void)merchantHeadViewRefreshButtonClick;

@end
@interface JFMerchantHeadView : UITableViewHeaderFooterView
- (IBAction)refreshAddressBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *currentAddressLabel;

/**
 *  快速创建henderView
 *
 */
+ (instancetype)headViewWithTableView:(UITableView *)tableView;

@property(nonatomic, strong)JFMerchantHeaderModel *headModel;
@property(nonatomic, weak) id<JFMerchantHeadViewRefreshDelegate>delegate;
@end
