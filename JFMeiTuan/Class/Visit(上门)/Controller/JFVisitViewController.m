//
//  JFVisitViewController.m
//  JF团购
//
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import "JFVisitViewController.h"
#import "JFImageScrollCell.h"
#import "JFServiceAdModel.h"
#import "JFHomeServiceCell.h"
#import "JFHomeServiceModel.h"
#import "JFWebViewController.h"
@interface JFVisitViewController ()<UITableViewDelegate, UITableViewDataSource, JFHomeServiceCellDelegate>
{
    NSMutableArray *_advArray;//广告数据源
    NSMutableArray *_homeServiceArray;//上门服务数据源
    NSMutableArray *_advImageUrlArray;//广告图片数组
}

@property (nonatomic , strong) UITableView *visitTableView;

@end

@implementation JFVisitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"上门";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化数组
    [self initData];
    
    //初始化tableView
    [self initVisitTableView];
    
    //设置刷新
    [self setRefreshInVisitTableView];

}
#pragma mark - 加载广告的数据
-(void)loadAdData{
    NSString *urlStr = [[GetUrlString sharedManager]urlWithVisitAd];
    [NetWork sendGetUrl:urlStr withParams:nil success:^(id responseBody) {
//        JFLog(@"%@", responseBody);
        [_advImageUrlArray removeAllObjects];
        [_advArray removeAllObjects];
        
        NSMutableArray *dataArray = [responseBody objectForKey:@"data"];
        for (int i = 0; i < dataArray.count;  ++i) {
            JFServiceAdModel *serviceAdvM = [JFServiceAdModel objectWithKeyValues:dataArray[i]];
            [_advArray addObject:serviceAdvM];
            [_advImageUrlArray addObject:serviceAdvM.imgUrl];
        }
        
        [self.visitTableView reloadData];

    } failure:^(NSError *error) {

        JFLog(@"%@", error);
    }];
    

}
#pragma mark - 加载家政服务的数据
-(void)laodServiewData{
    NSString *urlStr = [[GetUrlString sharedManager]urlWithVisitService];
    [NetWork sendGetUrl:urlStr withParams:nil success:^(id responseBody) {
        JFLog(@"%@", responseBody);
        [_homeServiceArray removeAllObjects];
        NSMutableArray *dataArray = [responseBody objectForKey:@"data"];
        for (int i = 0; i < dataArray.count; ++i) {
            JFHomeServiceModel *homeM = [JFHomeServiceModel objectWithKeyValues:dataArray[i]];
            [_homeServiceArray addObject:homeM];
        }
        
        [self.visitTableView.header endRefreshing];
        [self.visitTableView reloadData];

    } failure:^(NSError *error) {
        JFLog(@"%@", error);
        [self.visitTableView.header endRefreshing];

    }];

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initData{
    _advArray = [NSMutableArray array];
    _advImageUrlArray = [NSMutableArray array];
    _homeServiceArray = [NSMutableArray array];

}

-(void)initVisitTableView{
    self.visitTableView = [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64) withDelegate:self];
    [self.view addSubview:self.visitTableView];
    
}

#pragma mark - 设置下啦刷新
-(void)setRefreshInVisitTableView{
    //添加下拉的动画图片
    //设置下拉刷新回调
    [self.visitTableView addGifHeaderWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    
    //设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];

    UIImage *image = [UIImage imageNamed:@"icon_listheader_animation_1"];
    [idleImages addObject:image];

    [self.visitTableView.gifHeader setImages:idleImages forState:MJRefreshHeaderStateIdle];
    
    //设置即将刷新状态的动画图片
    NSMutableArray *refreshingImages = [NSMutableArray array];
    UIImage *image1 = [UIImage imageNamed:@"icon_listheader_animation_1"];
    [refreshingImages addObject:image1];
    UIImage *image2 = [UIImage imageNamed:@"icon_listheader_animation_2"];
    [refreshingImages addObject:image2];

  
    [self.visitTableView.gifHeader setImages:refreshingImages forState:MJRefreshHeaderStatePulling];
    
    //设置正在刷新是的动画图片
    [self.visitTableView.gifHeader setImages:refreshingImages forState:MJRefreshHeaderStateRefreshing];
    
    //马上进入刷新状态
    [self.visitTableView.gifHeader beginRefreshing];
    
    
}

-(void)refreshData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
        //1.加载广告的数据
        [self loadAdData];
        
        //2.加载服务的数据
        [self laodServiewData];

        dispatch_async(dispatch_get_main_queue(), ^{
            //这个里面是主线程要做的事  可以刷新UI
        });
    });


}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 155.0;
    }else{
        if (_homeServiceArray.count!=0) {
             NSInteger y = (_homeServiceArray.count +2-1)/2;
            return 125*y+5;
        }else{
            return 125*5+5;
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString *advCell = @"advCell";
        JFImageScrollCell *cell = [tableView dequeueReusableCellWithIdentifier:advCell];
        if (cell == nil) {
            cell = [[JFImageScrollCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:advCell frame:CGRectMake(0, 0, SCREENWIDTH, 155)];
        }
        
        //JFImageScrollCell *cell = [JFImageScrollCell cellWithTableView:tableView]; icon_defaultimage_listcell_movieMerchant@2x
        _advImageUrlArray = [NSMutableArray arrayWithObjects:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505811589650&di=dc099ff81afb793d9de5ccd60e192f4d&imgtype=0&src=http%3A%2F%2Fp17.qhimg.com%2Fbdml%2F1024_768_85%2Ft0143d91cc6497e9c7c.jpg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505811589650&di=ff21c04fc3d8ef5593c8cc2fb5a1530a&imgtype=0&src=http%3A%2F%2Fuploadfile.bizhizu.cn%2F2014%2F1225%2F20141225024129902.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505811589650&di=68da2ea49c6af84ef6902d19c8dffd97&imgtype=0&src=http%3A%2F%2Fimg1.gamedog.cn%2F2014%2F06%2F11%2F119-1406111024280.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505811589646&di=e195a6ff84206af2052f04b834d7ae27&imgtype=0&src=http%3A%2F%2Fimg2.3lian.com%2F2014%2Ff5%2F97%2Fd%2F48.jpg",nil];
        if (_advImageUrlArray.count !=0) {
            [cell setImageArray:_advImageUrlArray];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 1){
        JFHomeServiceCell *cell = [JFHomeServiceCell cellWithTableView:tableView];
        cell.delegate = self;
           _homeServiceArray = [NSMutableArray arrayWithObjects:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505811589650&di=dc099ff81afb793d9de5ccd60e192f4d&imgtype=0&src=http%3A%2F%2Fp17.qhimg.com%2Fbdml%2F1024_768_85%2Ft0143d91cc6497e9c7c.jpg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505811589650&di=ff21c04fc3d8ef5593c8cc2fb5a1530a&imgtype=0&src=http%3A%2F%2Fuploadfile.bizhizu.cn%2F2014%2F1225%2F20141225024129902.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505811589650&di=68da2ea49c6af84ef6902d19c8dffd97&imgtype=0&src=http%3A%2F%2Fimg1.gamedog.cn%2F2014%2F06%2F11%2F119-1406111024280.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505811589646&di=e195a6ff84206af2052f04b834d7ae27&imgtype=0&src=http%3A%2F%2Fimg2.3lian.com%2F2014%2Ff5%2F97%2Fd%2F48.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505811589645&di=0e31ea8f0ba4dcd9591cde255ec02814&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F19%2F21%2F14r58PICz9Z_1024.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505811589644&di=7014eea0b0844e61efbf21f29ec6381f&imgtype=0&src=http%3A%2F%2Fpic16.nipic.com%2F20110918%2F3970232_190241235000_2.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505811589639&di=a411d36fc2115ec7ef61d7fde45f7f51&imgtype=0&src=http%3A%2F%2Fbpic.ooopic.com%2F15%2F97%2F96%2F15979680-72ca1b989184d0527532f252894575bb-7.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505811589636&di=d6ebe454ac8d3b070df9007be13ec01c&imgtype=0&src=http%3A%2F%2Fd13.yihaodianimg.com%2Ft1%2F2012%2F1101%2F270%2F314%2Fae76c1f2b49a9d3bc77fecedee40a191.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505811589634&di=b2b807f98d89f2c1c608eb0a799c4932&imgtype=0&src=http%3A%2F%2Fpic35.photophoto.cn%2F20150415%2F0039038678199889_b.jpg",nil];
        [cell setHomeServiceArray:_homeServiceArray];
        return cell;
    }else{
        return nil;

    
    }

    
}
#pragma mark - JFHomeServiceCellDelegate
-(void)homeServiceCellTapClick:(long )index{
    JFLog(@"%ld", index-10);
//    JFHomeServiceModel *homeServiceModel = _homeServiceArray[index-10];
//    NSString *urlStr =  [[GetUrlString sharedManager]urlWithHomeServerWebData:homeServiceModel];
//    
//    JFWebViewController *webView = [[JFWebViewController alloc] init];
//    webView.urlStr = urlStr;
//    [self.navigationController pushViewController:webView animated:YES];

    
}






@end
