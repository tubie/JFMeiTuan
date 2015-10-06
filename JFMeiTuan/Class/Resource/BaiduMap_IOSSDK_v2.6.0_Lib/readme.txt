百度地图iOS SDK自v2.3.0起，采用可定制的形式为您提供开发包，当前开发包包含如下功能：
--------------------------------------------------------------------------------------
基础地图：包括基本矢量地图、卫星图、实时路况图和各种地图覆盖物，此外还包括各种与地图相关的操作和事件监听；
检索功能：包括POI检索，公交信息查询，路线规划，地理编码/反地理编码，在线建议查询，短串分享等；
LBS云检索：包括LBS云检索（周边、区域、城市内、详情）；
定位功能：获取当前位置信息；
计算工具：包括测距（两点之间距离）、坐标转换、调起百度地图导航等功能；
--------------------------------------------------------------------------------------
当前版本为v2.6.0，较上一个版本（v2.5.0）的更新内容如下：

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
 4、修复annotation拖拽结束后向下偏移的问题