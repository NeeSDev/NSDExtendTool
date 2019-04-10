//
//  KeychainAccess.h
//  KeychainAccessSample
//
//  Created by Ravi Prakash on 17/11/14.
//  Copyright (c) 2014 NeeSDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDKeychainAccess : NSObject
/**
 @brief 设置数据

 @param data 数据
 @param key 键值
 */
- (void)nsd_KeychainSetValue:(id)data forKey:(NSString*)key;

/**
 @brief 获取数据

 @param key 键值
 @return 数据
 */
- (id)nsd_KeychainGetValueForKey:(NSString*)key;


/**
 @brief 删除数据

 @param key 键值
 */
- (void)nsd_KeychainDeleteValueForKey:(NSString *)key;
@end
