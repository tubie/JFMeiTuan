//
//  JFDiscountWebViewController.h
//  JF团购
//
//  Created by 保修一站通 on 15/9/16.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFDiscountWebViewController : UIViewController

/**
 *  webview加载的url
 */
@property(nonatomic, strong) NSString *urlStr;

@property(nonatomic, strong) UIWebView *webView;

@end
