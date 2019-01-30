//
//  NSString+NSDQuicker.h
//  NSDExtendTools
//
//  Created by apple on 2019/1/30.
//  Copyright © 2019 NeeSDev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (NSDQuicker)
/**
 @brief 判断是否为空
 
 @return 空返回YES
 */
-(BOOL)nsd_IsEmpty;

/**
 @brief 判断是否为空

 @return 不空返回YES
 */
-(BOOL)nsd_IsNotEmpty;

/**
 @brief 转换Dictionary
 @discussion 只有jsonStr可以转换
 
 @return dic
 */
- (nullable NSDictionary *)nsd_GetDictionary;
@end

NS_ASSUME_NONNULL_END
