//
//  JFMapViewController.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/31.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFMapViewController.h"
#import "JFDataModel.h"
#import "JFAnnotation.h"
#import "JFAnnotationView.h"
#import "JFCalloutView.h"

@interface JFMapViewController (){
    NSMutableArray *_annotations;//存放标注的经纬度

}
@property (nonatomic ,strong)BMKMapView *mapView;

@end

@implementation JFMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMapView];
    [self initNav];
    [self initData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.mapView viewWillAppear];
    self.mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    _geocodesearch.delegate = self;
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [self.mapView viewWillDisappear];
    self.mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    _geocodesearch.delegate = nil;
    
}

#pragma mark - 初始化地图标注数据
-(void)initData{
    _annotations = [NSMutableArray array];
    NSString *urlStr =  [[GetUrlString sharedManager]urlWithMapData];
    [NetWork sendGetByReplacingUrl:urlStr withParams:nil success:^(id responseBody) {
        NSMutableArray *dataArray = [responseBody objectForKey:@"data"];
        
        NSLog(@"%@", dataArray);
        
        for (int i = 0; i < dataArray.count; i++) {
            JFDataModel  *jfdatamodel = [JFDataModel objectWithKeyValues:dataArray[i]];
            //创建annotation
            
            
            JFAnnotation *annotation = [[JFAnnotation alloc] init];
            
            annotation.jfModel = jfdatamodel;
            annotation.title = jfdatamodel.mname;
            annotation.subtitle = [NSString stringWithFormat:@"%@元",jfdatamodel.price];
            if (jfdatamodel.rdplocs.count>0) {
                NSDictionary *dic = jfdatamodel.rdplocs[0];
                NSNumber *lat = [dic objectForKey:@"lat"];
                NSNumber *lng = [dic objectForKey:@"lng"];
                annotation.coordinate = CLLocationCoordinate2DMake([lat doubleValue], [lng doubleValue]);
            }
            [_annotations addObject:annotation];
            
        }
        [self performSelectorOnMainThread:@selector(updateUI)withObject:_annotations waitUntilDone:YES];
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)updateUI{
    for (int i = 0; i < _annotations.count; i++) {
        [_mapView addAnnotation:_annotations[i]];
    }
    
}
#pragma mark - 初始化地图
-(void)initMapView{
    self.mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [self.view addSubview:self.mapView];
    
    _locService = [[BMKLocationService alloc]init];
    _geocodesearch = [[BMKGeoCodeSearch alloc]init];
    _locService.delegate = self;
    _geocodesearch.delegate = self;
    
    setCenter = YES;
    
    //定位
   // [self showCurrentLocation];

}
#pragma mark - 初始化返回按钮
-(void)initNav{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    backBtn.frame = CGRectMake(15, 20, 30, 30);
    [backBtn addTarget:self action:@selector(OnBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];


}
-(void)OnBackBtn:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark -开始定位
-(void)showCurrentLocation
{
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;
    _mapView.showsUserLocation = YES;//显示定位图层
}

#pragma mark - mapview delegate

/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
-(void)willStartLocatingUser
{
    JFLog(@"start locate");
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
    JFLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    JFLog(@"location error");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    JFLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [_mapView updateLocationData:userLocation];
    
    // [_mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
}



#pragma mark -根据anntation生成对应的View
- (BMKAnnotationView *)mapView:(BMKMapView *)view viewForAnnotation:(id <BMKAnnotation>)annotation
{
    
    JFAnnotationView *annotationView =  [JFAnnotationView annotationViewWithMapView:view viewForAnnotation:annotation];
    return annotationView;
    
}

- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view{
    
    
}


-(void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    if (setCenter == YES) {
        [_mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    }setCenter = NO;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
