//
//  JFImageScrollView.h
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
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
