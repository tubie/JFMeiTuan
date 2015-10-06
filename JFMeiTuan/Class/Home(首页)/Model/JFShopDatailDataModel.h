//
//  JFShopDatailDataModel.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/17.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFShopDatailDataModel : NSObject

//模型里字段太多，只选了几个需要用的
@property(nonatomic, strong) NSNumber *id;
@property(nonatomic, strong) NSString *imgurl;
@property(nonatomic, strong) NSString *mname;
@property(nonatomic, strong) NSString *title;


@property(nonatomic, strong) NSNumber *price;
@property(nonatomic, strong) NSNumber *value;//原价

@property(nonatomic, strong) NSNumber *solds;//已售

@end
