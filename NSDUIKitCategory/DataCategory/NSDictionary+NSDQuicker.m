//
//  NSDictionary+CustomFunc.m
//  EtahShadow
//
//  Created by apple on 2019/1/11.
//  Copyright © 2019 Nee. All rights reserved.
//

#import "NSDictionary+NSDQuicker.h"

@implementation NSDictionary (NSDQuicker)

- (NSString *)nsd_GetString
{
    // 转成Json数据
    if ([NSJSONSerialization isValidJSONObject:self])
    {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        if(error)
        {
            return nil;
        }
        NSString* jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return jsonString;
    }
    return nil;
}
@end
