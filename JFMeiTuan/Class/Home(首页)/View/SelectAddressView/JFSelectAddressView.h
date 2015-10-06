//
//  JFSelectAddressView.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/31.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFAddressScrollView;
@protocol  JFSelectAddressViewTapDelegate <NSObject>
@optional
-(void)removeMaskView;

@end
@interface JFSelectAddressView : UIView
@property (nonatomic, strong)JFAddressScrollView *addressScrollView;
@property (nonatomic, weak)id <JFSelectAddressViewTapDelegate>delegate;


@end
