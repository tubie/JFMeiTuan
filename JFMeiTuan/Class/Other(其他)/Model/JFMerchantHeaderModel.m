//
//  JFMerchantHeaderModel.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/29.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFMerchantHeaderModel.h"

@implementation JFMerchantHeaderModel

+(instancetype)headerModel:(NSDictionary *)dict{
    return  [[self alloc]initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        /**
         *  这个地方如果用KVC 的话有局限性，因为他都是一一对应的，少一个都不行
         */
        //[self setValuesForKeysWithDictionary:dict];
        self.detail = dict[@"detail"];
        self.province = dict[@"province"];
    }
    return self;
}

@end
