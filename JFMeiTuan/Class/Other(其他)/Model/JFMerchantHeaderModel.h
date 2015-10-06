//
//  JFMerchantHeaderModel.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/29.
//  Copyright (c) 2015年 JF团购. All rights reserved.
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
