//
//  zkRequestTool.h
//  BYXuNiPan
//
//  Created by kunzhang on 2018/7/5.
//  Copyright © 2018年 kunzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "QYZJTongYongModel.h"
typedef void(^SuccessBlock)(NSURLSessionDataTask * task,id responseObject);
typedef void(^FailureBlock)(NSURLSessionDataTask * task,NSError * error);
typedef void(^uploadProgressBlock)(CGFloat progress);


@interface zkRequestTool : NSObject

/**
 post_json
 */
+(void)networkingPOST:(NSString *)urlStr parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure;

/**
 post_json
 */
//+(void)networkingTwoPOST:(NSString *)urlStr parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure;


/**
 get_json
 */
//+(NSURLSessionDataTask *)networkingGET:(NSString *)urlStr parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure;

/**
 上传图片_json
 */
//+(void)NetWorkingUpLoad:(NSString *)urlStr image:(UIImage *)image andName:(NSString *)name parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure;

//上传图片
//+(void)NetWorkingUpLoadimage:(UIImage *)image  parameters:(id)parameters progress:(uploadProgressBlock)progress success:(SuccessBlock)success  failure:(FailureBlock)failure;

///**
// 多张上传图片
// */
+(void)NetWorkingUpLoad:(NSString *)urlStr images:(NSArray<UIImage *> *)images name:(NSString *)name parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure;

/**
 多张上传图片和视频或者音频
 */
+(void)NetWorkingUpLoad:(NSString *)urlStr images:(NSArray<UIImage *> *)images imgName:(NSString *)name fileData:(NSData *)fileData andFileName:(NSString *)fileName parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure;

///** 上传音频或者视频 */
//+(void)NetWorkingUpLoadVeidoWithfileData:(NSData *)fileData  parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure;
///**  上传音频 */
+(void)NetWorkingUpLoadMediaWithfileData:(NSData *)fileData  parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure;
//
//
///** 上传音频或者视频 */
//+(void)NetWorkingUpLoadVeidoWithfileData:(NSData *)fileData  parameters:(id)parameters progress:(uploadProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure;




+ (void)getUpdateImgeModelWithCompleteModel:(void(^)(QYZJTongYongModel * model))completeBlock;
+ (void)getUpdateVideoModelWithCompleteModel:(void(^)(QYZJTongYongModel * model))completeBlock;
+ (void)getUpdateAudioModelWithCompleteModel:(void(^)(QYZJTongYongModel * model))completeBlock;


@end
