//
//  JFMultipleButtonView.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/23.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JFMultipleButtonViewDelegate <NSObject>
@optional
-(void)multipleButtonViewClickAtIndex:(long)index;
@end


@interface JFMultipleButtonView : UIView{
    UIButton *btn_type;

}

/*
 *快速创建多个按钮
 */
-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;

@property(nonatomic, weak)id <JFMultipleButtonViewDelegate>delegate;

@end
