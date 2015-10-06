//
//  JFHotQueueModel.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/19.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFHotQueueModel : NSObject
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *imageUrl ;
@property(nonatomic, strong) NSNumber *within;
@property(nonatomic, strong) NSString *comment;
@property(nonatomic, strong) NSString *serviceUrl;

@end
