//
//  StoreModel.h
//  huhu
//
//  Created by gullmei on 15/10/25.
//  Copyright © 2015年 gullmei. All rights reserved.
//

#import "NSDModel.h"

/**
 @discussion 本地存储基类
 @discussion 支持存储多账户数据
 @discussion 若不需要区分账户，每次设置同一标识即可
 @discussion 使用本地序列化存储方式
 */
@interface NSDStore : NSDModel
/**
 @brief 当前数据
 */
@property (nonatomic, strong) NSMutableDictionary * dataDic;
/**
 @brief 获取对象单例
 
 @return 单例
 */
+ (instancetype)nsd_SharedInstance;

/**
 @brief 设置当前数据的唯一标识
 
 @param dataIdentify 数据唯一标识
 */
-(void)nsd_SetCurrentDataIdentify:(NSString *)dataIdentify;

/**
 @brief 获取当前数据的唯一标识

 @return 数据的唯一标识
 */
-(NSString *)nsd_GetCurrentDataIdentify;

/**
 @brief 存储全路径

 @param name 存储的key
 @return 存储路径
 */
- (NSString * )nsd_CreateFilePathWithName:(NSString *)name;


/**
 @brief 读取数据
 */
- (void)restoreData;


/**
 @brief 存储数据
 */
- (void)Save;

@end
