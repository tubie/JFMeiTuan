//
//  JFDiscountModel.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/19.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFDiscountModel : NSObject

@property(nonatomic, strong) NSNumber *position;
@property(nonatomic, strong) NSString *typeface_color;
@property(nonatomic, strong) NSNumber *id;
@property(nonatomic, strong) NSMutableDictionary *share;
@property(nonatomic, strong) NSString *title;

@property(nonatomic, strong) NSString *module;
@property(nonatomic, strong) NSString *maintitle;
@property(nonatomic, strong) NSString *tplurl;
@property(nonatomic, strong) NSNumber *type;
@property(nonatomic, strong) NSString *imageurl;


@property(nonatomic, strong) NSNumber *solds;
@property(nonatomic, strong) NSString *deputytitle;

@end
