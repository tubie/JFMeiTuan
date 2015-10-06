//
//  BMKLocationService.h
//  LocationComponent
//
//  Created by Baidu on 3/28/14.
//  Copyright (c) 2014 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMKUserLocation.h"
@class CLLocation;
/// 定位服务Delegate,调用startUserLocationService定位成功后，用此Delegate来获取定位数据
@protocol BMKLocationServiceDelegate <NSObject>
@optional
/**
 *在将要启动定位时，会调用此函数
 */
- (void)willStartLocatingUser;

/**
 *在停止定位后，会调用此函数
 */
- (void)didStopLocatingUser;

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation;

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation;

/**
 *定位失败后，会调用此函数
 *@param error 错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error;
@end

@interface BMKLocationService : NSObject

/// 当前用户位置，返回坐标为百度坐标
@property (nonatomic, readonly) BMKUserLocation *userLocation;

/// 定位服务Delegate,调用startUserLocationService定位成功后，用此Delegate来获取定位数据
@property (nonatomic, weak) id<BMKLocationServiceDelegate> delegate;

/*
 *在打开定位服务前设置
 *指定定位的最小更新距离(米)，默认：kCLDistanceFilterNone
 */
+ (void)setLocationDistanceFilter:(CLLocationDistance) distanceFilter;
/*
 *获取当前 定位的最小更新距离(米)
 */
+ (CLLocationDistance)getCurrentLocationDistanceFilter;
/*
 *在打开定位服务前设置
 *设置定位精确度，默认：kCLLocationAccuracyBest
 */
+ (void)setLocationDesiredAccuracy:(CLLocationAccuracy) desiredAccuracy;
/*
 *获取当前 定位精确度
 */
+ (CLLocationAccuracy)getCurrentLocationDesiredAccuracy;

/**
 *打开定位服务
 *需要在info.plist文件中添加(以下二选一，两个都添加默认使用NSLocationWhenInUseUsageDescription)：
 *NSLocationWhenInUseUsageDescription 允许在前台使用时获取GPS的描述
 *NSLocationAlwaysUsageDescription 允许永远可获取GPS的描述
 */
-(void)startUserLocationService;
/**
 *关闭定位服务
 */
-(void)stopUserLocationService;

@end
