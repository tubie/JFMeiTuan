//
//  JFSearchHistoryViewController.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/21.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFSearchHistoryViewController.h"
#import "JFSearchTextField.h"
#import "JFSearchHistoryCell.h"
#import "JFSearchHotCell.h"
#import "JFsearchHeaderView.h"


@interface JFSearchHistoryViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>


@property(nonatomic ,strong)UITableView *searchTableView;

/** 搜索文本框 */
@property (nonatomic, weak) JFSearchTextField *searchTF;
/** 搜索的tableView */
@property (nonatomic, strong) UITableView *tableView;
/** 搜索的数据 */
@property (nonatomic, strong) NSMutableArray *datas;
/** 历史搜索数据 */
@property (nonatomic, strong) NSMutableArray *hisDatas;
/** 热门数据模型 */
@property (nonatomic, strong) NSArray *hotDatas;

@end

@implementation JFSearchHistoryViewController

- (NSMutableArray *)hisDatas
{
    if (_hisDatas == nil) {
        _hisDatas = [NSMutableArray arrayWithContentsOfFile:JFSearchHistoryPath];
        if (_hisDatas == nil) {
            _hisDatas = [NSMutableArray arrayWithObjects:@"优衣库", nil];
        }
    }
    return _hisDatas;
}

- (NSArray *)hotDatas
{
    if (_hotDatas == nil) {
        _hotDatas = @[@"土鳖", @"不土", @"上海", @"莆田" , @"莆田"];
    }
    
    return _hotDatas;
}

/** 模拟数据,懒加载方法 */
- (NSMutableArray *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
        
        if (self.hisDatas.count) {
            [_datas addObject:self.hisDatas];
        }
        //热点搜索，估计服务器每次返回四个字符串
        [_datas addObject:self.hotDatas];
        
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initNav];
}

- (void)viewDidAppear:(BOOL)animated
{
    //文本框获取焦点
    [super viewDidAppear:animated];
    [self.searchTF becomeFirstResponder];
    
}

-(void)initView{
    self.searchTableView = [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 64) withDelegate:self];
    
    [self.view addSubview:self.searchTableView];
}

#pragma mark - 初始化导航栏
-(void)initNav{
    
    JFSearchTextField *search = [[JFSearchTextField alloc] init];
    CGFloat w = SCREENWIDTH * 0.7;
    search.frame = CGRectMake(0, 0, w, 30);
    search.delegate = self;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:search];
    self.searchTF = search;

    
    //取消按钮
    UIBarButtonItem *rightItem = [UIBarButtonItem initWithTitle:@"取消" titleColor:[UIColor whiteColor] target:self action:@selector(backClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
-(void)backClick{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
//监听手机键盘点击搜索的事件
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //判断是否有输入,有值的话将新的字符串添加到datas[0]中并且重新写入文件，发送网络请求
    /* 发送请求 */
    if (textField.text.length) {
        for (NSString *text in self.hisDatas) {
            if ([text isEqualToString:textField.text]) {
                return YES;
            }
        }
        [self.hisDatas insertObject:textField.text atIndex:0];
        [self.hisDatas writeToFile:JFSearchHistoryPath atomically:YES];
        [self.tableView reloadData];
        textField.text = @"";
    }
    
    return YES;
}
#pragma mark - UITableViewDataSource UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.datas.count == 2) {
        if (section == 0) {
            return [self.datas[0] count];
        } else {
            return 1;
        }
    } else {
        return 1;
    }
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
    //    WNXLog(@"%zd", self.hisDatas.count);
    //    if (self.hisDatas.count) {
    //        return 1;
    //    } else {
    //        return 0;
    //    }
    //    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.datas.count == 2 && indexPath.section == 0 && self.hisDatas.count) {
        JFSearchHistoryCell *cell = [JFSearchHistoryCell cellWithTableView:tableView IndexPath:indexPath atNSMutableArr:self.hisDatas];
        cell.searchHistoryLabel.text = self.datas[0][indexPath.row];
        return cell;
    } else {
        //这里就一个cell 不用注册了
        JFSearchHotCell *cell = [JFSearchHotCell cellWithTableView:tableView ];
        cell.array = self.hotDatas;
        
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    JFsearchHeaderView *headerView = [JFsearchHeaderView headViewWithTableView:tableView];
    if (self.hisDatas.count) {
        if (section == 0) {
            headerView.TitleLabel.text = @"历史";
        } else {
            headerView.TitleLabel.text = @"热门";
        }
    } else {
        headerView.TitleLabel.text = @"热门";
    }

    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
