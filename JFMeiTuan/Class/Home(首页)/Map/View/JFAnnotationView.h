//
//  JFAnnotationView.h
//  baoxiu51
//
//  Created by 保修一站通 on 15/8/24.
//  Copyright (c) 2015年 baoxiuyizhantong. All rights reserved.
//

#import "BMKAnnotationView.h"
@class JFCalloutView, JFAnnotation;
@interface JFAnnotationView : BMKAnnotationView

@property (nonatomic, strong)JFCalloutView *calloutView;
@property (nonatomic, strong)JFAnnotation *jfannotation;
/**
 *  通过mapView快速创建一个annotationView
 *  构造一个类方法，提供一个mapview参数，和annotation就返回一个标注视图
 */
+(instancetype)annotationViewWithMapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation;
@end
