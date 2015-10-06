/*
 *  BMKMapStatus.h
 *  BMapKit
 *
 *  Copyright 2011 Baidu Inc. All rights reserved.
 *
 */

#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>


///此类表示地图状态信息
@interface BMKMapStatus : NSObject
{
	float       _fLevel;       // 缩放比例，3－19级
    float       _fRotation;    // 旋转角度
    float       _fOverlooking; // 俯视角度
    
    CGPoint     _targetScreenPt;//屏幕坐标（中心点）
    CLLocationCoordinate2D _targetGeoPt;//地理坐标（中心点）
}
///缩放级别:[3~19]
@property (nonatomic, assign) float fLevel;
///旋转角度
@property (nonatomic, assign) float fRotation;
///俯视角度:[-45~0]
@property (nonatomic, assign) float fOverlooking;
///屏幕中心点坐标:在屏幕内，超过无效
@property (nonatomic) CGPoint targetScreenPt;
///地理中心点坐标:经纬度
@property (nonatomic) CLLocationCoordinate2D targetGeoPt;

@end



