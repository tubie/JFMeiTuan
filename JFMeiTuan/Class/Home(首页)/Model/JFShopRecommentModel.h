//
//  JFShopRecommentModel.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/17.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFShopRecommentModel : NSObject

@property(nonatomic, strong) NSNumber *dt;
@property(nonatomic, strong) NSString *cate;
@property(nonatomic, strong) NSString *brandname;
@property(nonatomic, strong) NSString *range;
@property(nonatomic, strong) NSString *mealcount;

@property(nonatomic, strong) NSMutableArray *campaigns;
@property(nonatomic, strong) NSNumber *ctype;
@property(nonatomic, strong) NSString *mlls;
@property(nonatomic, strong) NSString *subcate;
@property(nonatomic, strong) NSNumber *solds;

@property(nonatomic, strong) NSNumber *id;
@property(nonatomic, strong) NSMutableArray *attrJson;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSNumber *price;
@property(nonatomic, strong) NSNumber *canbuyprice;

@property(nonatomic, strong) NSNumber *festcanuse;
@property(nonatomic, strong) NSString *digestion;
@property(nonatomic, strong) NSNumber *value;
@property(nonatomic, strong) NSString *slug;
@property(nonatomic, strong) NSNumber *campaignprice;

@property(nonatomic, strong) NSNumber *nobooking;
@property(nonatomic, strong) NSString *imgurl;

@end
