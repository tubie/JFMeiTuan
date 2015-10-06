//
//  BMKVersion.h
//  BMapKit
//
//  Copyright 2011 Baidu Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


/*****更新日志：*****
 V0.1.0： 测试版
 支持地图浏览，基础操作
 支持POI搜索
 支持路线搜索
 支持地理编码功能
 --------------------
 V1.0.0：正式发布版
 地图浏览，操作，多点触摸，动画
 标注，覆盖物
 POI、路线搜索
 地理编码、反地理编码
 定位图层
 --------------------
 V1.1.0：
 离线地图支持
 --------------------
 V1.1.1：
 增加suggestionSearch接口
 可以动态更改annotation title
 fix小内存泄露问题
 --------------------
 V1.2.1：
 增加busLineSearch接口
 修复定位圈范围内不能拖动地图的bug
 
 --------------------
 V2.0.0
 
 新增：
 全新的3D矢量地图渲染
 BMKMapView设定地图旋转俯视角度：rotation、overlooking
 BMKMapView设定指南针显示位置：compassPosition
 BMKMapView控制生命周期：viewWillAppear、viewWillDisappear
 地图标注可点，BMKMapViewDelegate新增接口回调接口onClickedMapPoi
 BMKAnnotationView设置annotation是否启用3D模式：enabled3D
 overlay绘制方式改变，采用opengl绘制：
 BMKOverlayView使用opengl渲染接口：glRender子类重载此函数实现gl绘制
 基本opengl线绘制：renderLinesWithPoints
 基本opengl面绘制：renderRegionWithPointsl
 全新的矢量离线地图数据：
 BMKOfflineMap下载离线地图：start
 BMKOfflineMap更新离线地图：update
 BMKOfflineMap暂停下载或更新：pasue
 获得热点城市列表：getHotCityList
 获得支持离线数据的城市：getOfflineCityList
 根据城市名查询城市信息：searchCity
 更新：
 BMKMapView的缩放级别zoomLevel更新为float型，实现无级缩放
 更新地图类型枚举：
 enum {   BMKMapTypeStandard  = 1,              ///< 标准地图
 BMKMapTypeTrafficOn = 2,              ///< 实时路况
 BMKMapTypeSatellite = 4,              ///< 卫星地图
 BMKMapTypeTrafficAndSatellite = 8,    ///< 同时打开实时路况和卫星地图
 };
 
 
 --------------------
 v2.0.1
 新增：
 §	MapView增加事件监听
 BMKMapviewDelegate中- mapView: onClickedMapBlank:方法监听地图单击事件
 BMKMapviewDelegate中- mapView: onDoubleClick:方法监听地图双击事件
 BMKMapviewDelegate中- mapView: onLongClick:方法监听地图长按事件
 §	地图截图功能
 BMKmapview中 -(UIImage*) takeSnapshot;
 §	路径规划增加途经点
 BMKSearch中- (BOOL)drivingSearch: startNode: endCity: endNode: throughWayPoints:
 §	suggestion搜索支持按城市搜索
 优化：
 §	全面支持iPad
 §	优化添加海量annotation逻辑
 §	BMKOfflineMap中：
 - (BOOL)pasue:(int)cityID;
 改为
 - (BOOL)pause:(int)cityID
 §	BMKMapview中：
 @property (nonatomic) CGPoint compassPositon;
 改为
 @property (nonatomic) CGPoint compassPosition;
 §	BMKRouteAddrResult结构添加属性：
 @synthesize wayPointPoiList;
 @synthesize wayPointCityList;
 §	BMKPlanNode中添加属性：
 @synthesize cityName; 添加城市属性
 §	BMKSuggestionresult结构添加属性：
 @synthesize districtList; 返回区域列表
 修复：
 §	修复与第三方类库冲突的问题
 修复与gzip、Reachability、png、jpeg、json、xml、sqlite等第三方类库冲突问题
 
 
 --------------------
 v2.0.2
 新增：
 1.全新的key验证体系
 
 2.增加短串分享接口
 1）在BMKType中新增数据结构：BMK_SHARE_URL_TYPE（分享串数据类型）
 2）在BMKSearch中新增接口-(BOOL)poiDetailShareUrl:(NSString*) uid; 发起poi短串搜索
 3）在BMKSearch中新增接口-(BOOL)reverseGeoShareUrl:(CLLocationCoordinate2D)coor
 poiName:(NSString*)name
 poiAddress:(NSString*)address; 发起反geo短串搜索
 4）在BMKSearchDelegate中新增接口-(void)onGetShareUrl:(NSString*) url
 withType:(BMK_SHARE_URL_TYPE) urlType
 errorCode:(int)error; 返回短串分享url
 3.比例尺控件
 1）在BMKMapview中新增属性@property (nonatomic) BOOL showMapScaleBar;比例尺是否显示
 2）在BMKMapview中新增属性@property (nonatomic) CGPoint mapScaleBarPosition;比例尺显示位置
 
 4.定位罗盘效果
 1）在BMKMapview中新增数据结构：BMKUserTrackingMode（定位模式）
 2）在BMKMapview中新增属性@property (nonattomic) BMKUserTrackingMode userTrackingMode; 设定定位模式
 
 5.驾车避让拥堵策略
 1）在BMKSearch中新增驾车检索策略常量BMKCarTrafficFIRST = 60,///<驾车检索策略常量：躲避拥堵
 
 6.路径查询增加时间、打车费用结果
 1）在BMKSearch中新增类：BMKTime（此类代表一个时间段，每个属性都是一个时间段。）
 2）在BMKTransitRoutePlan中新增属性@property (nonatomic) float price; 白天打车估价，单位(元)
 3）在BMKTransitRoutePlan中新增属性@property (nonatomic, retain) BMKTime* time; 方案所用时间
 4）在BMKRoutePlan中新增属性@property (nonatomic, retain) BMKTime* time; 方案预计的行驶时间
 
 优化：
 1）对在BMKMapview中的接口- (void)removeAnnotations:(NSArray *)annotations;（移除一组标注）进行了优化
 
 修复：
 1）修复离线地图――支持离线包的城市列表中省份下无子城市的问题
 2）修复前台数据请求后退至后台opengl继续渲染，应用Crash的问题
 
 --------------------
 v2.1.0
 新增：
 1.全面接入LBS.云V2.0，全面开放LBS.云检索能力
 1)在BMKCloudSearchInfo中新增类BMKBaseCloudSearchInfo，BMKCloudSearchInfo，BMKCloudLocalSearchInfo，BMKCloudNearbySearchInfo，BMKCloudBoundSearchInfo，BMKCloudDetailSearchInfo来存储云检索参数
 2)在BMKCloudPOIList中新增类BMKCloudPOIList来存储云检索结果
 3)在BMKCloudSearch中新增数据结构：BMKCloudSearchType（云检索类型）
 4)在BMKCloudSearch中新增接口- (BOOL)localSearchWithSearchInfo:;发起本地云检索
 5)在BMKCloudSearch中新增接口- (BOOL) nearbySearchWithSearchInfo:;发起周边云检索
 6)在BMKCloudSearch中新增接口- (BOOL) boundSearchWithSearchInfo:;发起矩形云检索
 7)在BMKCloudSearch中新增接口- (BOOL) detailSearchWithSearchInfo:;发起详情云检索
 8)在BMKCloudSearch中新增接口- (void)onGetCloudPoiResult: searchType: errorCode:;返回云检索列表结果
 9)在BMKCloudSearch中新增接口- (void) onGetCloudPoiDetailResult: searchType: errorCode:;返回云检索详情结果
 2.增加图片图层BMKGroundOverlay、BMKGroundOverlayView
 1)在BMKGroundOverlay中新增属性@property (nonatomic,assign) CLLocationCoordinate2D pt;两种绘制GroundOverlay的方式之一：绘制的位置地理坐标，与anchor配对使用
 2)在BMKGroundOverlay中新增属性@property (nonatomic,assign) CGPoint anchor;用位置绘制时图片的锚点，图片左上角为(0.0f,0.0f),向右向下为正
 3)在BMKGroundOverlay中新增属性@property (nonatomic,assign) BMKCoordinateBounds bound;两种绘制GroundOverlay的方式之二：绘制的地理区域范围，图片在此区域内合理缩放
 4)在BMKGroundOverlay中新增属性@property(nonatomic, strong) UIImage *icon;绘制图片
 5)在BMKGroundOverlay中新增接口+(BMKGroundOverlay*)groundOverlayWithPosition:zoomLevel:anchor:icon:;根据指定经纬度坐标生成一个groundOverlay
 6)在BMKGroundOverlay中新增接口+(BMKGroundOverlay*) groundOverlayWithBounds:icon:;根据指定区域生成一个groundOverlay
 3.增加自定义泡泡
 1)在BMKActionPaopaoView中新增接口- (id)initWithCustomView:(UIView*)customView;泡泡显示View自定义
 4.增加地图中心点映射屏幕点
 1)在BMKMapView中新增接口- (void)setMapCenterToScreenPt:;设置地图中心点在地图中的屏幕坐标位置
 5.增加以手势触摸点中心为基准旋转缩放底图功能和控制开关
 1)在BMKMapView中新增属性@property(nonatomic, getter=isChangeWithTouchPointCenterEnabled) BOOL ChangeWithTouchPointCenterEnabled;设定地图View能否支持以手势中心点为轴进行旋转和缩放（默认以屏幕中心点为旋转和缩放中心）
 6.增加同时改变地图俯角，旋转角度，缩放比例，中心点接口
 1)新增类BMKMapStatus来表示地图状态参数
 2)在BMKMapView中新增接口- (void)setMapStatus:;设置地图状态
 3)在BMKMapView中新增接口- (void)setMapStatus: withAnimation:;设置地图状态（指定是否需要动画效果）
 4)在BMKMapView中新增接口- (void)setMapStatus: withAnimation: withAnimationTime:;设置地图状态（指定是否需要动画效果＋指定动画时间）
 5)在BMKMapView中新增接口- (BMKMapStatus*)getMapStatus;获取地图状态
 7.增加地图状态改变实时通知
 1)在BMKMapView中新增接口- (void)mapStatusDidChanged:;地图状态改变完成后会调用此接口
 
 优化：
 1.点击Annotation置顶
 1)在BMKMapView中新增属性@property (nonatomic, assign) BOOL isSelectedAnnotationViewFront;设定是否总让选中的annotaion置于最前面
 2.定位脱离MapView
 1)在BMKUserLocation中新增接口-(void)startUserLocationService;打开定位服务
 2)在BMKUserLocation中新增接口-(void)stopUserLocationService;关闭定位服务
 3)在BMKUserLocation中新增接口- (void)viewDidGetLocatingUser:;开启定位后，会自动调用此接口返回当前位置的经纬度
 3.定位图层样式自定义灵活性优化
 1)新增类BMKLocationViewDisplayParam来存储定位图层自定义参数
 2)在BMKMapView中新增接口- (void)updateLocationViewWithParam:;动态定制定位图层样式
 
 修复：
 1)修复点击annotation回调长按监听接口- (void)mapview: onLongClick:的问题
 2)修复TransitRoutePlan中Content属性为空的问题
 3)修复缩放底图，接口- (void)mapView: regionDidChangeAnimated:不回调的问题
 4)修复从其他页面返回原页面泡泡被压盖的问题
 5)解决WiFi无网络信号时首次加载卡屏的问题
 
 --------------------
 v2.1.1
 新增：
 1.新增调启百度地图导航的接口（百度地图导航和Web端导航）
 在BMKNavigation中新增类枚举类型的数据结构BMK_NAVI_TYPE来定义调起导航的两种类型：BMK_NAVI_TYPE_NATIVE(调起客户端导航)和BMK_NAVI_TYPE_WEB(调起web导航)
 在BMKNavigation中新增类NaviPara来管理调起导航时传入的参数
 在类NaviPara中新增属性@property (nonatomic, retain) BMKPlanNode* startPoint;定义导航的起点
 在类NaviPara中新增属性@property (nonatomic, retain) BMKPlanNode* endPoint;定义导航的终点
 在类NaviPara中新增属性@property (nonatomic, assign) BMK_NAVI_TYPE naviType;定义导航的类型
 在类NaviPara中新增属性@property (nonatomic, retain) NSString* appScheme;定义应用返回scheme
 在类NaviPara中新增属性@property (nonatomic, retain) NSString* appName;定义应用名称
 在BMKNavigation中新增接口+ (void)openBaiduMapNavigation:;根据传入的参数调启导航
 
 2.几何图形绘制中，增加弧线绘制方法
 在BMKArcline中新增接口+ (BMKArcline *)arclineWithPoints:;根据指定坐标点生成一段圆弧
 在BMKArcline中新增接口+ (BMKArcline *)arclineWithCoordinates:;根据指定经纬度生成一段圆弧
 在类BMKArclineView中新增属性@property (nonatomic, readonly) BMKArcline *arcline;来定义该View对应的圆弧数据对象
 在BMKArclineView中新增接口- (id)initWithArcline:;根据指定的弧线生成一个圆弧View
 
 3.几何图形绘制中，扩增凹多边形绘制能力
 
 4.新增Key验证返回值
 在BMKMapManager中新增枚举数据类型EN_PERMISSION_STATUS类来定义key验证错误码
 服务端具体返回的错误码请参见http://developer.baidu.com/map/lbs-appendix.htm#.appendix2
 
 5.新增公交换乘查询中的结果字段
 在类BMKLine中新增属性@property (nonatomic) int zonePrice;定义路段价格
 在类BMKLine中新增属性@property (nonatomic) int totalPrice;定义线路总价格
 在类BMKLine中新增属性@property (nonatomic) int time;定义线路耗时，单位：秒
 在类BMKRoute中新增属性@property (nonatomic) int time;定义此路段的消耗时间，单位：秒
 
 优化：
 优化Key鉴权认证策略
 优化几何图形绘制中，折线段绘制末端圆滑
 提升添加、删除几何图形覆盖物的效率
 修复：
 修复iOS7系统下，定位图层拖图时卡顿的bug
 修复POI检索结果中，结果页索引始终为0的bug
 修复驾车线路规划中，最后一个节点提示信息有误的bug
 --------------------
 v2.2.0
 新增：
 1. 新增地图多实例能力，开发者可在同一个页面上构建多张相互独立的地图，各地图上的覆盖物互不干扰；
 2. 新增检索多实例能力，开发者可并行发起多个检索来满足自己实际的业务需求
 由于新增检索多实例能力，因此需要在BMKSearchDelegate的回调中增加searcher参数来表明是哪个检索对象发起的检   索。所以应用检索多实例时需要将检索结果和searcher来进行一一对应。示例如下：
 - (void)onGetPoiResult:(BMKSearch*)searcher result:(NSArray*)poiResultListsearchType:(int)type errorCode:(int)error{
 if(searcher==_search){
 NSLog(@"这是_search 对应的POI搜索结果");
 }else if(searcher==_search2){
 NSLog(@"这是_search2对应的POI搜索结果");
 }
 }
 3. 新增地图最大、最小缩放等级的控制方法
 在类BMKMapView中新增属性@property (nonatomic) float minZoomLevel;来设定地图的自定义最小比例尺级别
 在类BMKMapView中新增属性@property (nonatomic) float maxZoomLevel;来设定地图的自定义最大比例尺级别
 4. 新增地图操作的手势控制开关
 在类BMKMapView中新增属性@property(nonatomic, getter=isZoomEnabledWithTap) BOOL zoomEnabledWithTap;来设定地图View能否支持用户单指双击放大地图，双指单击缩小地图
 在类BMKMapView中新增属性@property(nonatomic, getter=isOverlookEnabled) BOOL overlookEnabled;来设定地图View能否支持俯仰角
 在类BMKMapView中新增属性@property(nonatomic, getter=isRotateEnabled) BOOL rotateEnabled;来设定地图View能否支持旋转
 
 
 修复：
 1.  修复遗留zip库冲突问题
 2.  解决Documents下的非用户数据上传iCloud的问题
 3.  修复BMKMapViewDelegate中regionDidChangeAnimated / regionWillChangeAnimated图区变化问题
 --------------------
 v2.2.1
 修复：
 1.  修复v2.2.0版本覆盖安装后，地图无法正常显示的问题
 2.  修复地图高级别下，道路名称不显示的问题
 3.  修复BMKMapManage的stop方法不可用的问题
 4.  修复setMapStatus中设置地图等级异常的问题
 5.  修复地图中心点偏移时，拖动地图覆盖物异常的问题
 6.  修复BMKMapView中手势控制相关的enable属性获取不正确的问题
 7.  修复与XML库冲突的问题
 --------------------
 v2.3.0
 新增：
 可根据开发者的实际需求，下载满足需求的定制功能开发包
 1.  基础地图:包括基本矢量地图、卫星图、实时路况图、离线地图及各种地图覆盖物，此外还包括各种与地图相关的操作和事件监听
 2.  检索功能:包括POI检索、公交信息查询、路线规划、正向/反向地理编码、在线建议查询、短串分享等功能
 针对检索业务设计了全新更易用、学习成本更低的程序功能接口
 3.  LBS云检索:提供周边、区域、城市内、详情多种方式检索用户存储在LBS云内的自有数据
 4.  定位功能:提供便捷的接口，帮助用户快捷获取当前位置信息
 实现全面升级优化，定位功能可脱离地图单独使用
 5.  计算工具:包括测距（两点之间地理距离）、坐标转换、调起百度地图导航等功能
 --------------------
 v2.4.0
 新增：
 基础地图
 1. 开放热力图绘制能力，帮助用户绘制自有数据热力图；
 在文件BMKHeatMap.h中新增类BMKHeatMapNode来表示热力图数据的单个数据节点
 在类BMKHeatMapNode中新增属性@property (nonatomic) CLLocationCoordinate2D pt;定义点的位置坐标
 在类BMKHeatMapNode中新增属性@property (nonatomic) double intensity;定义点的强度权值
 在BMKHeatMap中新增类BMKHeatMap来存储热力图的绘制数据和自定义热力图的显示样式
 在类BMKHeatMap中新增属性@property (nonatomic, assign) int mRadius; 设置热力图的柔化半径
 在类BMKHeatMap中新增属性@property (nonatomic, retain) BMKGradient* mGradient; 设置热力图的渐变色
 在类BMKHeatMap中新增属性@property (nonatomic, assign) double mOpacity; 设置热力图的透明度
 在类BMKHeatMap中新增属性@property (nonatomic, retain) NSMutableArray* mData; 设置热力图数据
 在类BMKMapView中新增方法- (void)addHeatMap:;来添加热力图
 在类BMKMapView中新增方法- (void)removeHeatMap;来删除热力图
 
 检索功能
 1. 开放POI的Place详情信息检索能力；
 在BMKPoiSearchOption.h文件中新增poi详情检索信息类BMKPoiDetailSearchOption
 在类 BMKPoiDetailSearchOption中新增属性@property (nonatomic, retain) NSString* poiUid; poi的uid
 在BMKPoiSearchType.h文件中新增poi详情检索结果类BMKPoiDetailResult
 在类BMKPoiSearch中新增方法- (BOOL)poiDetailSearch:;来根据poi uid 发起poi详情检索
 在BMKPoiSearchDelegate中新增回调- (void)onGetPoiDetailResult: result: errorCode:;来返回POI详情搜索结果
 
 定位功能
 1. 新增定位多实例，满足开发者在多个页面分别使用定位的需求；
 优化：
 1. 高级别地图下做平移操作时，标注覆盖物移动流畅性优化；
 修复：
 1. 修复相邻地形图图层拼接时，接缝过大的问题；
 2. 修复检索内存泄露的问题；
 3. 修复定位图层内存泄露的问题；
 --------------------
 v2.4.1
 优化：
 1. 优化底图相关的内存使用问题；
 
 --------------------
 v2.5.0
 使用Xcode6创建工程时注意事项如下：
 在info.plist中添加：Bundle display name （Xcode6新建的项目没有此配置，若没有会造成manager start failed）
 【 新 增 】
 1. 新增对arm64 CPU架构的适配；
 基础地图
 1. 新增对iPhone6、iPhone6 plus的屏幕适配；
 定位功能
 1. 新增对iOS8定位的适配；
 在使用SDK为您提供的定位功能时，注意事项如下：
 需要在info.plist里添加（以下二选一，两个都添加默认使用NSLocationWhenInUseUsageDescription）：
 NSLocationWhenInUseUsageDescription  ，允许在前台使用时获取GPS的描述
 NSLocationAlwaysUsageDescription  ，允许永久使用GPS的描述
 【 修 复 】
 修复Tabber控制器中使用定位弹出框异常的问题；
 修复scrollenable=no，仍可以移动地图的问题；
 修复多边形在特定坐标下显示异常问题；
 修复定位时间戳错误的问题；
 修复autolayout时，BMKMapView横屏时无法自动扩展的问题；
 修复从B页返回到A页后，在A页的viewWillAppear方法中setCenterCoordinate无效的问题；
 
 --------------------
 v2.6.0
 注意：新版本开发包头文件中部分接口和枚举类型有变更，请确保使用最新版本的头文件。
 【 变 更 】
 定位功能
 1、修改BMKLocationServiceDelegate：
 - (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation;  //修改用户位置更新后的回调
 
 【 新 增 】
 基础地图
 1. 地图类型修改为：enum {
 BMKMapTypeStandard = 1,               ///<标准地图
 BMKMapTypeSatellite = 2,               ///<卫星地图
 };
 typedefNSUIntegerBMKMapType;
 2. 在类BMKMapView中新增：
 属性：baiduHeatMapEnabled，设定地图是否打开百度城市热力图图层（百度自有数据）
 接口：- isSurpportBaiduHeatMap，判断当前图区是否支持百度热力图
 属性：buildingsEnabled ，设定地图是否现实3D楼块效果
 属性：trafficEnabled, 设定地图是否打开路况图层
 接口：- (void)showAnnotations: animated:，设置地图使显示区域显示所有annotations
 接口：+(void)willBackGround，当应用即将后台时调用，停止一切调用opengl相关的操作
 接口：+(void)didForeGround，当应用恢复前台状态时调用
 3. 在类BMKMapViewDelegate中新增接口：
 - (void)mapViewDidFinishLoading: 地图初始化完毕时会调用
 - (void)mapView: onDrawMapFrame: 地图渲染每一帧画面过程中(地图更新)会调用
 4. 在BMKGroundOverlay.h中新增透明度设置属性: alpha
 5. 新增虚线绘制样式polyline／polygon的边框／circle的边框均可设定为虚线样式并指定颜色，自定义overlay也可在glrender中实现。
 新增资源：
 在mapapi.bundle的images文件夹中增加lineDashTexture.png，用于生成虚线纹理
 新增属性：
	在BMKOverlayGLBaseView.h中，@propertyBOOLlineDash;// 是否为虚线样式
	在BMKOverlayView.h中新增方法：
 -(void)renderLinesWithPoints:(BMKMapPoint *)points pointCount:(NSUInteger)pointCount
 strokeColor:(UIColor *)strokeColor
 lineWidth:(CGFloat)lineWidth
 looped:(BOOL)looped
 lineDash:(BOOL)lineDash;
 注：该方法再BMKPolylineView／BMKPolygonView／BMKCircleView绘制中会自动调用，用户自定义view也可以调用这个方法实线虚线样式。
 6. 新增自定义纹理绘制线：polyline／polygon的边框／circle的边框均可设定指定纹理，自定义overlay也可在glrender中实现。
 在BMKOverlayView.h中新增属性：
 @property (nonatomic, readonly) GLuintstrokeTextureID;//关联的纹理对象ID
 在BMKOverlayView.h中新增方法：
 -(GLuint)loadStrokeTextureImage:(UIImage *)textureImage;
 
 定位功能
 1、在BMKLocationService新增接口：
 +setLocationDistanceFilter:  //设置定位的最小更新距离(米)
 +getCurrentLocationDistanceFilter  //获取定位的最小更新距离(米)
 +setLocationDesiredAccuracy:  //设置定位精准度
 +getCurrentLocationDesiredAccuracy  //获取定位精准度
 
 【 优 化 】
 1. SDK配置使用ARC；
 2. 更新鉴权错误码；

 【 修 复 】
 1. 修复定位服务中，开启定位和停止定位没有成对使用造成的问题；
 2. 修复使用circleWithCenterCoordinate:radius:画圆时半径误差偏大的问题；
 3. 修复在6plus上标注显示过小的问题；
 4. 修复annotation拖拽结束后向下偏移的问题；
 

 *********************/
/**
 *获取当前地图API的版本号
 *return  返回当前API的版本号
 */

UIKIT_STATIC_INLINE NSString* BMKGetMapApiVersion()
{
	return @"2.6.0";
}
