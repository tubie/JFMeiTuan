//
//  JFMineModel.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/29.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFMineModel.h"

@implementation JFMineModel

+(instancetype)mineModel:(NSDictionary *)dict{
    return  [[self alloc]initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        /**
         *  这个地方如果用KVC 的话有局限性，因为他都是一一对应的，少一个都不行
         */
        //[self setValuesForKeysWithDictionary:dict];
        self.title = dict[@"title"];
        self.imageName = dict[@"image"];
    }
    return self;
}
@end
