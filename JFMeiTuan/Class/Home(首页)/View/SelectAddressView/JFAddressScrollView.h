//
//  JFAddressScrollView.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/31.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JFAddressScrollViewButtonDelegate <NSObject>
@optional
-(void)areaButtonClick:(UIButton *)button;

@end

@protocol JFChangeCityButtonDelegate <NSObject>
@optional
-(void)changeCityButtonClick:(UIButton *)button;

@end

@interface JFAddressScrollView : UIView

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

+ (instancetype)scrollView;

@property(nonatomic, weak)id <JFAddressScrollViewButtonDelegate> delegate;

@property(nonatomic, weak)id <JFChangeCityButtonDelegate>changeCityDelegate;
- (IBAction)changeCityButtonClick:(id)sender;

@end
