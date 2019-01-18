//
//  NSDictionary+CustomFunc.h
//  EtahShadow
//
//  Created by apple on 2019/1/11.
//  Copyright © 2019 Nee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @brief 字典拓展处理
 */
@interface NSDictionary (NSDConversion)

/**
 @brief 转换成json字符串

 @return jsonStr
 */
- (NSString *)nsd_GetString;

@end

NS_ASSUME_NONNULL_END
