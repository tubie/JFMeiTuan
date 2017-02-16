//
//  NetWork.m
//  JF团购
//
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import "NetWork.h"

@implementation NetWork

+(void)sendGetUrl:(NSString *)url withParams:(NSDictionary *)params success:(successBlock) success failure:(failureBlock)failure
{
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    [manger GET:urlStr parameters:params
     
        success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        success(responseObject);
    }   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];

}

+(void)sendGetByReplacingUrl:(NSString *)url withParams:(NSDictionary *)params success:(successBlock) success failure:(failureBlock)failure
{
    NSString *urlStr = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    [manger GET:urlStr parameters:params
     
        success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         success(responseObject);
     }   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         failure(error);
     }];
    
    
}


@end
