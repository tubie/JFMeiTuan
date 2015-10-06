//
//  JFImageScrollView.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/22.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFImageScrollView : UIView

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIPageControl *pageControl;
@property (nonatomic, strong)NSArray *imgArray;

-(void)setImageArray:(NSArray *)imageArray;


/**
 *  创建一个ScrollView
 *
 *  @param frame      供外界提供一个frame
 *  @param imageArray 供外界提供一个图片数组
 *
 *  @return 返回一个自定义的ScrollView
 */
-(JFImageScrollView * )initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray;

@end
