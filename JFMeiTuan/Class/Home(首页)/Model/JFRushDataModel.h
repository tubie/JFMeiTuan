//
//  JFRushDataModel.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/19.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFRushDataModel : NSObject

@property(nonatomic, strong) NSNumber *id;
@property(nonatomic, strong) NSMutableArray *share;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSNumber *start;
@property(nonatomic, strong) NSNumber *listJumpToTouch;

@property(nonatomic, strong) NSNumber *type;
@property(nonatomic, strong) NSString *descBefore;
@property(nonatomic, strong) NSMutableArray *deals;
@property(nonatomic, strong) NSNumber *end;
@property(nonatomic, strong) NSString *touchUrlForList;

@property(nonatomic, strong) NSString *descIn;
@property(nonatomic, strong) NSString *descAfter;

@end
