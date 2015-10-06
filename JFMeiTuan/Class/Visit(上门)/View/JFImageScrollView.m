//
//  JFImageScrollView.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/22.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFImageScrollView.h"

@interface JFImageScrollView ()<UIScrollViewDelegate>{
    NSTimer *_timer;
    int _pageNumber;
}

@end

@implementation JFImageScrollView

-(JFImageScrollView * )initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView = [[UIScrollView alloc]initWithFrame:frame];
        self.scrollView.contentSize = CGSizeMake(4 * SCREENWIDTH, frame.size.height);
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        //添加图片
        for(int i = 0 ; i < 10; i++){
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake(i*SCREENWIDTH, 0, SCREENWIDTH, frame.size.height);
            imageView.tag = i+10;
           // UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapImage:)];
            //[imageView addGestureRecognizer:tap];
            imageView.userInteractionEnabled = YES;
            [self.scrollView addSubview:imageView];
        }
        [self addSubview:self.scrollView];
        
        //
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(SCREENWIDTH/2-40, frame.size.height-40, 80, 30)];
        self.pageControl.currentPage = 0;
        self.pageControl.numberOfPages = 6;
        [self addSubview:self.pageControl];
        
        [self addTimer];

        
    }
    return self;

}

-(void)setImageArray:(NSArray *)imageArray{
    _pageNumber = (int)imageArray.count;
    self.scrollView.contentSize = CGSizeMake(imageArray.count * SCREENWIDTH, self.frame.size.height);
    self.pageControl.numberOfPages = imageArray.count;
    //添加图片
    for(int i = 0 ; i < imageArray.count; i++){
        UIImageView *imageView = (UIImageView *)[self.scrollView viewWithTag:i+10];
        imageView.backgroundColor = [UIColor redColor];

        NSString *imageName =[NSString stringWithFormat:@"%@",imageArray[i]];
        NSLog(@"%@",imageName);
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"]];        
    }
}
-(void)addTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(netxPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

-(void)removeTimer{
    [_timer invalidate];
    _timer = nil;
}

-(void)netxPage{
    int page = (int)self.pageControl.currentPage;
    if (page == _pageNumber-1) {
        page = 0;
    }else{
        page++;
    }
    //滚动scrollview
    CGFloat x = page * self.scrollView.frame.size.width;
    self.scrollView.contentOffset = CGPointMake(x, 0);
}

#pragma mark - UIScrollViewDelegate
//滑动时
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat scrollViewW = scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollViewW/2)/scrollViewW;
    self.pageControl.currentPage = page;
}
//开始拖动时
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}
//结束拖动
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}

/**
 *  移除定时器
 */
-(void)dealloc{
    [self removeTimer];
}

@end
