//
//  JFMerchantFilterView.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/28.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//
#define TableViewW self.frame.size.width
#define TableViewH self.frame.size.height

#import "JFMerchantFilterView.h"
#import "JFKindFilterCell.h"
#import "JFMerchantCataGroupModel.h"
#import "JFKindSubclassFilterCell.h"

@interface JFMerchantFilterView ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_bigGroupArray;//左边分组tableview的数据源
    NSMutableArray *_smallGroupArray;//右边分组tableview的数据源
    
    NSInteger _bigSelectedIndex;
    NSInteger _smallSelectedIndex;
}

@end

@implementation JFMerchantFilterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        _bigGroupArray = [[NSMutableArray alloc] init];
        _smallGroupArray = [[NSMutableArray alloc] init];

        [self initViews];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self getCateListData];
        });
    }
    return self;
}

-(void)initViews{
    for (int i = 0 ; i < 2; i ++) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(i *TableViewW/2,  0, TableViewW/2, TableViewH) style:UITableViewStylePlain];
        tableView.tag = 10 + i ;
        tableView.delegate = self;
        tableView.dataSource = self;
        if (i == 0 ) {
            self.tableViewOfGroup =tableView;
            self.tableViewOfGroup.backgroundColor = [UIColor whiteColor];

        }else{
            self.tableViewOfDetail =tableView;
            self.tableViewOfDetail.backgroundColor = RGB(242, 242, 242);

        }
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:tableView];

    }

}

-(void)getCateListData{
    NSString *urlStr = [[GetUrlString sharedManager]urlWithCateListStr];
    [NetWork sendGetUrl:urlStr withParams:nil success:^(id responseBody) {
        JFLog(@"%@", responseBody);
        NSMutableArray *dataArray = [responseBody objectForKey:@"data"];
        for (int i = 0; i < dataArray.count; i++) {
            JFMerchantCataGroupModel *cateModel = [JFMerchantCataGroupModel objectWithKeyValues:dataArray[i]];
            [_bigGroupArray addObject:cateModel];
        }
        [self.tableViewOfGroup reloadData];
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 10) {
        return _bigGroupArray.count;
    }else{
        if (_bigGroupArray.count == 0) {
            return 0;
        }
        JFMerchantCataGroupModel *subclassCateM = (JFMerchantCataGroupModel *)_bigGroupArray[_bigSelectedIndex];
        if (subclassCateM.list == nil) {
            return 0;
        }else{
            return subclassCateM.list.count;
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 42;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 10) {
        JFKindFilterCell *cell = [JFKindFilterCell cellWithTableView:tableView];
        cell.merchantCataGroupModel = _bigGroupArray[indexPath.row];
        return cell;
    }else{
         JFMerchantCataGroupModel *cateModel = (JFMerchantCataGroupModel *)_bigGroupArray[_bigSelectedIndex];
        JFKindSubclassFilterCell *cell = [JFKindSubclassFilterCell cellWithTableView:tableView indexPath:indexPath model:cateModel];
        return cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 10) {
        _bigSelectedIndex = indexPath.row;
        JFMerchantCataGroupModel *cataModel =  _bigGroupArray[_bigSelectedIndex];
        [self.tableViewOfDetail reloadData];
        if (cataModel.list == nil) {
            [self.tableViewOfDetail reloadData];
            [self.delegate tableView:tableView didSelectRowAtIndexPath:indexPath withId:cataModel.id];
        }else{
            [self.tableViewOfDetail reloadData];
        }
    }else{
        _smallSelectedIndex = indexPath.row;
        JFMerchantCataGroupModel *cataModel =  _bigGroupArray[_bigSelectedIndex];
        NSDictionary *dict =  cataModel.list[_smallSelectedIndex];
        NSNumber *ID = [dict objectForKey:@"id"];
//        NSString *name = [dic objectForKey:@"name"];
        [self.delegate tableView:tableView didSelectRowAtIndexPath:indexPath withId:ID ];
        
    }

}



@end
