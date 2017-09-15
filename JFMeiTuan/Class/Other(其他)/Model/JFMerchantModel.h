//
//  JFMerchantModel.h
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <Foundation/Foundation.h>

@interface JFMerchantModel : NSObject

@property (nonatomic, strong) NSString *frontImg;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *avgScore;//星星
@property (nonatomic, strong) NSNumber *markNumbers;//评价个数
@property (nonatomic, strong) NSString *cateName;

@property (nonatomic, strong) NSString *areaName;
@property (nonatomic, strong) NSNumber *avgPrice;
@property (nonatomic, strong) NSNumber *brandId;
@property (nonatomic, strong) NSString *poiid;


@end
