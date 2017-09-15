//
//  JFDiscountWebViewController.h
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <UIKit/UIKit.h>

@interface JFDiscountWebViewController : UIViewController

/**
 *  webview加载的url
 */
@property(nonatomic, strong) NSString *urlStr;

@property(nonatomic, strong) UIWebView *webView;

@end
