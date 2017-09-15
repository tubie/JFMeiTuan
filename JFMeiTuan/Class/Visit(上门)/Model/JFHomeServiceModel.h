//
//  JFHomeServiceModel.h
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <Foundation/Foundation.h>

@interface JFHomeServiceModel : NSObject
@property(nonatomic, strong) NSString *background;
@property(nonatomic, strong) NSNumber *cateId;
@property(nonatomic, strong) NSString *cateImgUrl;
@property(nonatomic, strong) NSString *cateName;
@property(nonatomic, strong) NSString *clickable;

@property(nonatomic, strong) NSString *jumpType;
@property(nonatomic, strong) NSString *jumpUrl;
@property(nonatomic, strong) NSString *open;
@property(nonatomic, strong) NSString *showType;

@end
