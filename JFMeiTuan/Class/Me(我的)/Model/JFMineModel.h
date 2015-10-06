//
//  JFMineModel.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/29.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFMineModel : NSObject
/**
 *  标题
 */
@property (nonatomic ,copy)NSString *title;
/**
 *  图片名
 */
@property (nonatomic ,copy)NSString *imageName;
+(instancetype)mineModel:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;

@end
