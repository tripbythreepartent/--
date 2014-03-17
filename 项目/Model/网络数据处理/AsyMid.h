//
//  AsyMid.h
//  项目
//
//  Created by dlios17 on 14-3-7.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^ConnectBlock)();

@interface AsyMid : NSObject<NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    
    ConnectBlock _connBlock;
    NSMutableData *_receiveData;
}
//web引用
extern  NSString * const HS_TripConnection;//注册接口
extern  NSString * const RS_TripConnection;//登陆接口

extern NSString *const TripConnection;
extern NSString *const FindConnection;
extern NSString *const DetailConnection;

typedef void(^ConnectBlock)();


//get异步加载数据
+ (void)asynGetWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block;

//get异步加载数据
+(void)asyncPostWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block;

+(void)asyncPostWithParmaUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block;


+(void)connectionWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block;

@end


