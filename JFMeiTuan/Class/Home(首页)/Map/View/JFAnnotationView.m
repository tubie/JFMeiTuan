//
//  JFAnnotationView.m
//  baoxiu51
//
//  Created by 保修一站通 on 15/8/24.
//  Copyright (c) 2015年 baoxiuyizhantong. All rights reserved.
//

#import "JFAnnotationView.h"
#import "JFCalloutView.h"
#import "JFAnnotation.h"
#import "JFDataModel.h"

#define kCalloutWidth       200.0
#define kCalloutHeight      70.0

@implementation JFAnnotationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setJfannotation:(JFAnnotation *)jfannotation{
    _jfannotation = jfannotation;
}
-(void)setSelected:(BOOL)selected{
    [self setSelected:selected animated:YES];
}
-(void)setSelected:(BOOL)selected animated:(BOOL)animated{

    if (self.selected == selected) {
        return;
    }
    if (selected) {
        if (self.calloutView == nil) {
            self.calloutView = [[JFCalloutView alloc] initWithFrame:CGRectMake(0, 0, kCalloutWidth, kCalloutHeight)];
            
            self.calloutView.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x,-CGRectGetHeight(self.calloutView.bounds) / 2.f + self.calloutOffset.y);
        }
        NSString *imgUrl = [self.jfannotation.jfModel.imgurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"104.63"];
        [self.calloutView.imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
        self.calloutView.title = self.annotation.title;
        self.calloutView.subtitle = self.annotation.subtitle;

        
        [self addSubview:self.calloutView];
    }else{
        [self.calloutView removeFromSuperview];
    }
    [super setSelected:selected animated:animated];
    
}

//重写此函数,⽤用以实现点击calloutView判断为点击该annotationView
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    BOOL inside = [super pointInside:point withEvent:event];
    if (!inside && self.selected) {
        inside = [self.calloutView pointInside:[self convertPoint:point toView:self.calloutView] withEvent:event];
    }
    return inside;
}
/**
 *  通过mapView快速创建一个annotationView
 */
+(instancetype)annotationViewWithMapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]])
    {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        JFAnnotationView *annotationView = (JFAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[JFAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
        }
        if ([annotation isKindOfClass:[JFAnnotation class]]){
            annotationView.jfannotation = (JFAnnotation *)annotation;
        }
        annotationView.canShowCallout = NO;
        annotationView.image = [UIImage imageNamed:@"icon_map_cateid_1"];

        // 设置中⼼心点偏移,使得标注底部中间点成为经纬度对应点
        
        // annotationView.centerOffset = CGPointMake(0, -18);
        return annotationView;
    }
    return nil;
    
    
}


@end
