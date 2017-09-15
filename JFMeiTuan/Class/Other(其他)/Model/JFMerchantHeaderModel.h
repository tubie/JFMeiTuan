//
//  JFMerchantHeaderModel.h
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <Foundation/Foundation.h>

@interface JFMerchantHeaderModel : NSObject
/**
 *  详细地址
 */
@property (nonatomic ,copy)NSString *detail;
/**
 *  省份
 */
@property (nonatomic ,copy)NSString *province;
//@property (nonatomic ,copy)NSString *area;
//@property (nonatomic ,copy)NSString *city;
//@property (nonatomic ,copy)NSString *district;
//@property (nonatomic ,copy)NSString *id;
//@property (nonatomic ,copy)NSString *lat;
//@property (nonatomic ,copy)NSString *lng;
//@property (nonatomic ,copy)NSString *parentArea;


+(instancetype)headerModel:(NSDictionary *)dict;

-(instancetype)initWithDict:(NSDictionary *)dict;


@end
