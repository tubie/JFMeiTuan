//
//  JFMineViewController.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/11.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFMineViewController.h"
#import "JFMineModel.h"
#import "JFMineCell.h"
#import "JFMineHeaderView.h"
#import "JFMineBigTitleCell.h"
#import "JFWebViewController.h"
@interface JFMineViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mineTableView;
@property (nonatomic, strong) NSArray *mineModelArray;

@end

@implementation JFMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"我的";
    self.view.backgroundColor = [UIColor clearColor];
    [self initView];
}

-(void)initView{
    self.mineTableView =[UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64) withDelegate:self];
    [self.view addSubview:self.mineTableView];
    
}
/**
 *  懒加载
 *
 *  @return 就是下声明mineModelArray的get方法
 */
-(NSArray *)mineModelArray{
    if (_mineModelArray == nil) {
        NSArray *mineArray =  [GetPlistArray arrayWithString:@"MineInformationData.plist"];
        NSMutableArray *dictArray = [NSMutableArray array];
        for (NSDictionary *dict  in mineArray) {
            JFMineModel *model =  [JFMineModel mineModel:dict];
            [dictArray addObject:model];
        }
        _mineModelArray = dictArray;

    }
    return _mineModelArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.mineModelArray.count;
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section ==  0) {
        return 75;
    }else{
        return 5;
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }else{
        return 40;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section== 0) {
        JFMineHeaderView *headView = [JFMineHeaderView headViewWithTableView:tableView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headerTap:)];
        [headView addGestureRecognizer:tap];
        return headView;
        
    }else{
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 5)];
        headerView.backgroundColor = RGB(239, 239, 244);
        return headerView;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        JFMineModel *mineModel = self.mineModelArray [indexPath.row];
        JFMineCell *cell = [JFMineCell cellWithTableView:tableView mineModel:mineModel];
        return cell;
    }else{
        JFMineBigTitleCell *cell = [JFMineBigTitleCell cellWithTableView:tableView];
        return cell;
    }
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
   
    
}


-(void)headerTap:(UITapGestureRecognizer *)sender
{
    JFWebViewController *webVC = [[JFWebViewController alloc]init];
    webVC.urlStr = @"http://www.jianshu.com/p/50e219ecbd45";
    [self.navigationController pushViewController:webVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
