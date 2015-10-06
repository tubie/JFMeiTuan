//
//  JFAddressScrollView.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/31.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFAddressScrollView.h"

@implementation JFAddressScrollView

+ (instancetype)scrollView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"JFAddressScrollView" owner:nil options:nil] lastObject];;
}


-(void)layoutSubviews{
    NSArray *array =  [GetPlistArray arrayWithString:@"citydata.plist"];
    NSArray *cityArray =  [array objectAtIndex:8] [@"citylist"];
     NSArray *areaArray = [cityArray objectAtIndex:0][@"arealist"];
    JFLog(@"%@", areaArray);
    //允许scrollerView竖直移动
    self.scrollView.alwaysBounceVertical = YES;
    //允许scrollerView的可移动内容
    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT-150);
    //三列
     int totalloc = 3;
    
     CGFloat buttonw = 70;
     CGFloat buttonh = 30;
    
    //算出间距
     CGFloat margin=(self.frame.size.width - totalloc * buttonw) / (totalloc + 1);
     //int count=11;
     for (int i = 0; i < areaArray.count; i++) {
         NSDictionary *dict = areaArray[i];
         NSString *titleStr = dict[@"areaName"];
         int row = i / totalloc;//行号
         //0/3=0,1/3=0,2/3=1; (i 从0到2都是第一行) i＝ 3的时候第二行
         
         int loc = i % totalloc;//列号
         
         //横坐标
         CGFloat buttonx = margin + (margin + buttonw) * loc;
         
         //纵坐标
         CGFloat buttony = margin + (margin + buttonh) * row;
         
         
         //创建uiview控件
         UIButton *areaButton=[[UIButton alloc]initWithFrame:CGRectMake(buttonx, buttony, buttonw, buttonh)];
         [areaButton setTitle:titleStr forState:UIControlStateNormal];
         [areaButton setBackgroundColor: navigationBarColor];
         [areaButton addTarget:self action:@selector(areaButtonClick:) forControlEvents:UIControlEventTouchUpInside];
         [self.scrollView addSubview:areaButton];

     }

}

-(void)areaButtonClick:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(areaButtonClick:)]) {
        [self.delegate areaButtonClick:button];
    }
    
}
- (IBAction)changeCityButtonClick:(id)sender {
    if ([self.changeCityDelegate respondsToSelector:@selector(changeCityButtonClick:)]) {
        [self.changeCityDelegate changeCityButtonClick:sender];
    }
}
@end
