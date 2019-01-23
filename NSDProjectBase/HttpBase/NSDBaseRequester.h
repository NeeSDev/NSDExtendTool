//
//  BaseRequestEngine.h
//  EtahShadow
//
//  Created by apple on 2018/12/26.
//  Copyright © 2018 Nee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

/**
 @brief 通用成功block

 @param responseObject 返回数据
 */
typedef void(^NSDHttpSuccessBlock)(id _Nullable responseObject);

/**
 @brief 通用失败block
 
 @param errorObject 错误信息
 */
typedef void(^NSDHttpFailedBlock)(id _Nullable errorObject);


/**
 @discussion 需要解析的源数据类型
 */
typedef NS_ENUM(NSInteger, NSDOriginDataClass) {
    NSDOriginDataClassDictionary    = 0,///< 字典，默认
    NSDOriginDataClassArray      ,   ///< 数组
    NSDOriginDataClassString      ,   ///< 字符串
};

NS_ASSUME_NONNULL_BEGIN
/**
 @discussion http网络请求基类
 */
@interface NSDBaseRequester : NSObject

/**
 @brief 请求地址
 */
@property(nonatomic,strong) NSString *requestUrl;
/**
 @brief 请求参数dictionary
 */
@property(nonatomic,strong) NSDictionary *requestParam;
/**
 @brief 请求方式
 */
@property(nonatomic,strong) NSString *requestType;
/**
 @brief 请求的头
 */
@property(nonatomic,strong) NSDictionary *requestHeader;
/**
 @brief 数据回包对应的解析model 需继承于jsonmodel
 */
@property (nonatomic,assign) Class _Nullable originDataModel;
/**
 @brief 数据回包类型
 @discussion NSDOriginDataClass 默认为Dictionary
 */
@property (nonatomic,assign) NSDOriginDataClass originDataClass;

/**
 @brief 开始发起请求

 @param successBlock 成功回调 SccessBlock
 @param failedBlock 失败回调 FailedBlock
 */
- (void)nsd_RequestStartWithSuccessBlock:(NSDHttpSuccessBlock)successBlock
                             FailedBlock:(NSDHttpFailedBlock)failedBlock;

/**
 @brief 上传单张照片

 @param data 照片数据
 @param fileName 照片上传到服务器的名称
 @param fileKey 照片上传服务器取数据的key
 @param successBlock 成功回调 SccessBlock
 @param failedBlock 失败回调 FailedBlock
 */
-(void)nsd_UploadFileWithFileData:(NSData *)data
                         FileName:(NSString *)fileName
                          FileKey:(NSString *)fileKey
                         FileType:(NSString *)fileType
                     SuccessBlock:(NSDHttpSuccessBlock)successBlock
                      FailedBlock:(NSDHttpFailedBlock)failedBlock;

@end

NS_ASSUME_NONNULL_END
