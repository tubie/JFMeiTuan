//
//  JFHomeServiceModel.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/24.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFHomeServiceModel : NSObject
@property(nonatomic, strong) NSString *background;
@property(nonatomic, strong) NSNumber *cateId;
@property(nonatomic, strong) NSString *cateImgUrl;
@property(nonatomic, strong) NSString *cateName;
@property(nonatomic, strong) NSString *clickable;

@property(nonatomic, strong) NSString *jumpType;
@property(nonatomic, strong) NSString *jumpUrl;
@property(nonatomic, strong) NSString *open;
@property(nonatomic, strong) NSString *showType;

@end
