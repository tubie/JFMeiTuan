/*
 *  BMKPolyline.h
 *  BMapKit
 *
 *  Copyright 2011 Baidu Inc. All rights reserved.
 *
 */

#import "BMKMultiPoint.h"
#import "BMKOverlay.h"

/// 此类用于定义一段折线
@interface BMKPolyline : BMKMultiPoint <BMKOverlay>

/**
 *根据指定坐标点生成一段折线
 *@param points 指定的直角坐标点数组
 *@param count 坐标点的个数
 *@return 新生成的折线对象
 */
+ (BMKPolyline *)polylineWithPoints:(BMKMapPoint *)points count:(NSUInteger)count;

/**
 *根据指定坐标点生成一段折线
 *@param coords 指定的经纬度坐标点数组
 *@param count 坐标点的个数
 *@return 新生成的折线对象
 */
+ (BMKPolyline *)polylineWithCoordinates:(CLLocationCoordinate2D *)coords count:(NSUInteger)count;

@end
