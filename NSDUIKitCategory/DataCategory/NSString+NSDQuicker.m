//
//  NSString+NSDQuicker.m
//  NSDExtendTools
//
//  Created by apple on 2019/1/30.
//  Copyright © 2019 NeeSDev. All rights reserved.
//

#import "NSString+NSDQuicker.h"

@implementation NSString (NSDQuicker)
-(BOOL)nsd_IsEmpty
{
    if ([@"" isEqualToString:self]) {
        return YES;
    }
    return NO;
}

-(BOOL)nsd_IsNotEmpty
{
    if ([@"" isEqualToString:self]) {
        return NO;
    }
    return YES;
}

- (NSDictionary *)nsd_GetDictionary
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}
@end
