//
//  JFMultipleButtonView.h
//  JF团购
//
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
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
