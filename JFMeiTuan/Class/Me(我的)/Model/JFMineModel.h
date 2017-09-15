//
//  JFMineModel.h
//  JF团购
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import <Foundation/Foundation.h>

@interface JFMineModel : NSObject
/**
 *  标题
 */
@property (nonatomic ,copy)NSString *title;
/**
 *  图片名
 */
@property (nonatomic ,copy)NSString *imageName;
+(instancetype)mineModel:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;

@end
