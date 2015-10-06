//
//  JFDataModel.m
//  baoxiu51
//
//  Created by 保修一站通 on 15/8/24.
//  Copyright (c) 2015年 baoxiuyizhantong. All rights reserved.
//

#import "JFDataModel.h"

@implementation JFDataModel

+(instancetype)dataModelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
       
    }
    return self;
}

@end
