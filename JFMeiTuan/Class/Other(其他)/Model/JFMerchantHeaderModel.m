//
//  JFMerchantHeaderModel.m
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
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
