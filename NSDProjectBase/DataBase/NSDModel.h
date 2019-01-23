//
//  BaseModel.h
//  Baseproject
//
//  Created by gullmei on 15/9/11.
//  Copyright (c) 2015年 黄定坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
/**
 @discussion 数据解析基类
 @discussion 对JSONModel二次封装
 */
@interface NSDModel : JSONModel<NSCoding>
/**
 @brief 对象的初始化

 @param dictionary 源数据
 */
+ (instancetype)nsd_GetModelWithDictionary:(NSDictionary *)dictionary;

/**
 @brief 对象数组的初始化

 @param array 源数据
 */
+ (NSArray*)nsd_GetModelWithArray:(NSArray *)array;

/**
 @brief 特殊取值处理
 
 @param dictionary 源数据
 */
- (void)nsd_SpecialDataHandling:(NSDictionary *)dictionary;
@end
