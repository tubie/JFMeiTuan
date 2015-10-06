//
//  JFMapViewController.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/31.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFMapViewController : UIViewController<BMKLocationServiceDelegate, BMKMapViewDelegate, BMKGeneralDelegate, BMKGeoCodeSearchDelegate>{
    BMKLocationService *_locService;
    BMKGeoCodeSearch* _geocodesearch;
    BMKPointAnnotation *pointAnnotation;
     BOOL setCenter;
    
}

@end
