/*
 *  BMKNavigation.h
 *  BMapKit
 *
 *  Copyright 2011 Baidu Inc. All rights reserved.
 *
 */
#import <UIKit/UIKit.h>
#import"BMKTypes.h"
//定义调起导航的两种类型
typedef enum
{
    BMK_NAVI_TYPE_NATIVE = 0,//客户端导航
    BMK_NAVI_TYPE_WEB,//web导航
} BMK_NAVI_TYPE;

///此类管理调起导航时传入的参数
@interface BMKNaviPara : NSObject
{
	BMKPlanNode* _startPoint;
	BMKPlanNode* _endPoint;
	BMK_NAVI_TYPE _naviType;
    NSString* _appScheme;
    NSString* _appName;
}
///起点
@property (nonatomic, strong) BMKPlanNode* startPoint;
///终点
@property (nonatomic, strong) BMKPlanNode* endPoint;
///导航类型
@property (nonatomic, assign) BMK_NAVI_TYPE naviType;
///应用返回scheme
@property (nonatomic, strong) NSString* appScheme;
///应用名称
@property (nonatomic, strong) NSString* appName;


@end

///主引擎类
@interface BMKNavigation : NSObject

/**
*启动导航
*@param para 调起导航时传入得参数
*/
+ (void)openBaiduMapNavigation:(BMKNaviPara*)para;


@end


