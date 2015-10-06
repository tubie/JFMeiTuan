//
//  AppDelegate.h
//  JF团购
//
//  Created by 保修一站通 on 15/7/15.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate, BMKMapViewDelegate, BMKGeneralDelegate>{
    BMKMapManager *_mapManager;
}


@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;


@end

