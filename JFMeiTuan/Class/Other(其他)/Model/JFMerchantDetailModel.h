//
//  JFMerchantDetailModel.h
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <Foundation/Foundation.h>

@interface JFMerchantDetailModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *avgScore;//星星
@property (nonatomic, strong) NSNumber *avgPrice;//人均
@property (nonatomic, strong) NSString *frontImg;//背景图
@property (nonatomic, strong) NSString *addr;//地址

@property (nonatomic, strong) NSString *phone;//电话
@property (nonatomic, strong) NSString *featureMenus;//推荐菜

@end
