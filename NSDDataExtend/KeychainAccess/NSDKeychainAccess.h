//
//  KeychainAccess.h
//  KeychainAccessSample
//
//  Created by Ravi Prakash on 17/11/14.
//  Copyright (c) 2014 NeeSDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDKeychainAccess : NSObject
- (void)nsd_KeychainSetValue:(id)data forKey:(NSString*)key;

- (id)nsd_KeychainGetValueForKey:(NSString*)key;

- (void)nsd_KeychainDeleteValueForKey:(NSString *)key;
@end
