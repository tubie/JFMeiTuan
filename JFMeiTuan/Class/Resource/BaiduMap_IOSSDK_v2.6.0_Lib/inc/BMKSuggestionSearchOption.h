/*
 *  BMKSuggestionSearchOption.h
 *  BMapKit
 *
 *  Copyright 2014 Baidu Inc. All rights reserved.
 *
 */

/// sug检索信息类
@interface BMKSuggestionSearchOption : NSObject
{
    NSString        *_keyword;
    NSString        *_cityname;
    
}
///搜索关键字
@property (nonatomic, strong) NSString *keyword;
///城市名
@property (nonatomic, strong) NSString *cityname;

@end


