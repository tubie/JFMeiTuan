//
//  JFMultipleButtonView.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/23.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFMultipleButtonView.h"
#define viewW self.frame.size.width


@implementation JFMultipleButtonView

-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray{
    if (self = [super initWithFrame:frame]) {
        
     
        NSInteger  buttonCount = titleArray.count;
        for (int i = 0; i < titleArray.count ; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = i +10;
            button.frame = CGRectMake(i * viewW/buttonCount, 5 , viewW/buttonCount, 30);
            button.layer.borderColor= [UIColor whiteColor].CGColor;
            button.layer.borderWidth = 0.5;
            
            [button setTitle:titleArray[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
            button.titleLabel.font = kFONT12;
            
            if (i == 0) {
                button.selected = YES;
                btn_type = button;

            }
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
       
        
    }
    return self;

}

#pragma button-Action这个地方引入一个butotn类型册参数 用来接收(三段式)
-(void)buttonClick:(UIButton *)button{
    if (!btn_type) {
        btn_type = button;
        btn_type.selected = !btn_type.selected;
    }else{
        btn_type.selected = NO;
        btn_type = button;
        btn_type.selected = YES;
    }
    
    if ( [self.delegate respondsToSelector:@selector(multipleButtonViewClickAtIndex:)]) {
        [self.delegate multipleButtonViewClickAtIndex:(button.tag -10)];
    }

}

@end
