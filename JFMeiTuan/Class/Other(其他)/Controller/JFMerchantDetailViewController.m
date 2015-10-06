//
//  JFMerchantDetailViewController.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/18.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFMerchantDetailViewController.h"
#import "JFMerchantDetailModel.h"
#import "JFMerchantArountGroupModel.h"
#import "JFMerchantDetailImageCell.h"
#import "JFMerchantDetailAddressCell.h"
#import "JFMerchantAroundGroupCell.h"
#import "JFAroundBuyTitleCell.h"
@interface JFMerchantDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UILabel *_titleLabel;
    NSMutableArray *_dataSourceArray;
    NSMutableArray *_dealsArray;//附近团购数组
}

@property(nonatomic, strong)UITableView *merchantDetailTableView;

@end

@implementation JFMerchantDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self loadMerchantDetailData];
    [self getAroundGroupPurchaseData];
    [self initNav];
    [self initView];
    
    
   
}
-(void)initNav{
    
    self.title = @"商家详情";
    UIBarButtonItem *leftItem = [UIBarButtonItem initWithNormalImage:@"back" target:self action:@selector(OnBackBtn) width:23 height:23];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}
-(void)OnBackBtn{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void)initView{
    self.merchantDetailTableView = [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64) withDelegate:self];
    [self.view addSubview:self.merchantDetailTableView];

}
-(void)initData{
    _dataSourceArray = [[NSMutableArray alloc] init];
    _dealsArray = [[NSMutableArray alloc] init];
}

#pragma mark - 请求商家详情数据
-(void)loadMerchantDetailData{
    
    NSString *urlStr =  [[GetUrlString sharedManager]urlWithMerchantDetail:self.poiid];
    [NetWork sendGetByReplacingUrl:urlStr withParams:nil success:^(id responseBody) {
        NSMutableArray *dataArray = [responseBody objectForKey:@"data"];
        if (dataArray.count>0) {
            [_dataSourceArray removeAllObjects];
            JFMerchantDetailModel *merDetailM = [JFMerchantDetailModel objectWithKeyValues:dataArray[0]];
            [_dataSourceArray addObject:merDetailM];
        }
        
        [self.merchantDetailTableView reloadData];

    } failure:^(NSError *error) {
        
    }];

}
#pragma mark - 附近团购
-(void)getAroundGroupPurchaseData{
    NSString *urlStr =  [[GetUrlString sharedManager]urlWithMerchantAroundGroupPurchaseData:self.poiid];
    [NetWork sendGetByReplacingUrl:urlStr withParams:nil success:^(id responseBody) {
        NSDictionary *dataDic = [responseBody objectForKey:@"data"];
        NSMutableArray *dealsArray = [dataDic objectForKey:@"deals"];
        [_dealsArray removeAllObjects];
        for (int i = 0; i < dealsArray.count; i++) {
            JFMerchantArountGroupModel *jfAroundM = [JFMerchantArountGroupModel objectWithKeyValues:dealsArray[i]];
            [_dealsArray addObject:jfAroundM];
        }
        
        [self.merchantDetailTableView reloadData];

        
    } failure:^(NSError *error) {
        
    }];

}
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_dealsArray.count>0) {
        return 3;
    }
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return _dealsArray.count+1;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 160;
    }else if(indexPath.section == 1){
        return 54;
    }else if (indexPath.section == 2){
        if (indexPath.row>0) {
            return 100;
        }
        return 40;
    }else{
        return 40;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        JFMerchantDetailImageCell *cell = [JFMerchantDetailImageCell cellWithTableView:tableView];
        //这个地方务必要做一个异常判断
        if (_dataSourceArray.count >  0 ) {
            cell.merchantDetailModel =  _dataSourceArray[0];
        }
        return  cell;
        
    }else if (indexPath.section ==1){
        JFMerchantDetailAddressCell *cell =[JFMerchantDetailAddressCell cellWithTableView:tableView];
        if (_dataSourceArray.count >  0 ) {
            cell.merchantDetailModel =  _dataSourceArray[0];
        }
        return  cell;
    }else if (indexPath.section == 2 && indexPath.row == 0){
        JFAroundBuyTitleCell *cell = [JFAroundBuyTitleCell cellWithTableView:tableView];
        return  cell;
        
    }else{
        JFMerchantAroundGroupCell *cell = [JFMerchantAroundGroupCell cellWithTableView:tableView];
        cell.merchantArountGroupModel = _dealsArray[indexPath.row-1];
        return  cell;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
