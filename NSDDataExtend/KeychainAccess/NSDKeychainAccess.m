//
//  KeychainAccess.m
//  KeychainAccessSample
//
//  Created by Ravi Prakash on 17/11/14.
//  Copyright (c) 2014 helpshift. All rights reserved.
//

#import "NSDKeychainAccess.h"

@implementation NSDKeychainAccess
+ (NSMutableDictionary *)nsd_KeychainGetQuery:(NSString *)key {
    NSMutableDictionary *querry =  [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge id)kSecClassGenericPassword, (__bridge id)kSecClass,
            key, (__bridge id)kSecAttrAccount,
            @"com.helpshift.test",(__bridge id)kSecAttrService,
            nil];
    
    return  querry;
}

- (void)nsd_KeychainSetValue:(id)data forKey:(NSString*)key {
    NSMutableDictionary *keychainQuery = [NSDKeychainAccess nsd_KeychainGetQuery:key];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge id)kSecValueData];
    SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
}

- (id)nsd_KeychainGetValueForKey:(NSString *)key {
    id value = nil;
    NSMutableDictionary *keychainQuery = [NSDKeychainAccess nsd_KeychainGetQuery:key];
    //uncomment to see keychainQuery
    //NSLog(@"%@",keychainQuery);
    CFDataRef keyData = NULL;
    [keychainQuery setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    [keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    if (SecItemCopyMatching((__bridge CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
            value = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
    }
    return value;
}

- (void)nsd_KeychainDeleteValueForKey:(NSString *)key {
    NSMutableDictionary *keychainQuery = [NSDKeychainAccess nsd_KeychainGetQuery:key];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
}


@end
