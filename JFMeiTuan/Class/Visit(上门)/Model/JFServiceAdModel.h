//
//  JFServiceAdModel.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/22.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFServiceAdModel : NSObject

@property(nonatomic, strong) NSNumber *id;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *commonTitle;
@property(nonatomic, strong) NSString *imgUrl;
@property(nonatomic, strong) NSString *imgUrlSize;

@property(nonatomic, strong) NSString *bigImgTypeUrl;
@property(nonatomic, strong) NSString *bigImgUrlSize;
@property(nonatomic, strong) NSString *app;
@property(nonatomic, strong) NSNumber *type;
@property(nonatomic, strong) NSString *typeDesc;

@property(nonatomic, strong) NSMutableArray *standIdList;
@property(nonatomic, strong) NSNumber *startTime;
@property(nonatomic, strong) NSNumber *endTime;
@property(nonatomic, strong) NSNumber *level;
//@property(nonatomic, strong) NSNumber *newUser;

@property(nonatomic, strong) NSNumber *closable;
@property(nonatomic, strong) NSNumber *channelType;
@property(nonatomic, strong) NSMutableDictionary *channelListMap;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *url;

@end
