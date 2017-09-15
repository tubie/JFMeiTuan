//
//  GetPlistArray.m
//  JF团购
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import "GetPlistArray.h"

@implementation GetPlistArray
+(NSArray *)arrayWithString:(NSString *)string{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:string ofType:nil];
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:plistPath];
    return array;
    
}


@end
