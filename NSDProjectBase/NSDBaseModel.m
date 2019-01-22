//
//  BaseModel.m
//  Baseproject
//
//  Created by gullmei on 15/9/11.
//  Copyright (c) 2015年 黄定坤. All rights reserved.
//

#import "NSDBaseModel.h"
#include <objc/runtime.h>

@implementation NSDBaseModel

-(id)init {
    self = [super init];
    if (self) {
        //仅初始化self的属性，父类的不管，考虑到父类是基类，需要自己去做特殊处理，无需多余的自动初始化
        u_int count;
        objc_property_t *properties =class_copyPropertyList([self class], &count);
        NSScanner *scanner = nil;
        NSString* propertyType = nil;
        //自动初始化赋值，避免某些时候调用为空
        for (int i = 0; i<count; i++)
        {
            objc_property_t property = properties[i];
            
            //属性名称
            NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];

            const char *attrs = property_getAttributes(property);
            NSString* propertyAttributes = @(attrs);
            NSArray* attributeItems = [propertyAttributes componentsSeparatedByString:@","];
            
            //ignore read-only properties
            if ([attributeItems containsObject:@"R"]) {
                continue; //to next property
            }
            
             scanner = [NSScanner scannerWithString: propertyAttributes];
            
            //JMLog(@"attr: %@", [NSString stringWithCString:attrs encoding:NSUTF8StringEncoding]);
            [scanner scanUpToString:@"T" intoString: nil];
            [scanner scanString:@"T" intoString:nil];
            
            //check if the property is an instance of a class
            if ([scanner scanString:@"@\"" intoString: &propertyType]) {
                [scanner scanUpToCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:@"\"<"]
                                        intoString:&propertyType];
                
                if ([propertyType isEqualToString:@"NSString"]) {
                    [self setValue:@"" forKey:propertyName];
                }
                else{
                    Class someClass = NSClassFromString(propertyType);
                    id tempObj = [[someClass alloc] init];
                    [self setValue:tempObj forKey:(NSString *)propertyName];
                    [tempObj release];
                }
            }
        }
        free(properties);
    }
    return self;  //如果失败返回，self的值是nil，返回的nil
    
}
- (void)initData {
    //初始化单例数据
}

//解析时各属性默认为可选项
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

#pragma mark - 存储编解码

- (void)encodeWithCoder:(NSCoder *)encoder {
    Class cls = [self class];
    while (cls != [NSObject class]) {
        unsigned int numberOfIvars = 0;
        Ivar* ivars = class_copyIvarList(cls, &numberOfIvars);
        for(const Ivar* p = ivars; p < ivars+numberOfIvars; p++)
        {
            Ivar const ivar = *p;
            const char *type = ivar_getTypeEncoding(ivar);
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            if([key isEqualToString:@"_delegate"])
            {
                continue;
            }
            id value = [self valueForKey:key];
            if (value) {
                switch (type[0]) {
                    case _C_STRUCT_B: {
                        NSUInteger ivarSize = 0;
                        NSUInteger ivarAlignment = 0;
                        NSGetSizeAndAlignment(type, &ivarSize, &ivarAlignment);
                        NSData *data = [NSData dataWithBytes:(const char *)self + ivar_getOffset(ivar)
                                                      length:ivarSize];
                        [encoder encodeObject:data forKey:key];
                    }
                        break;
                    default:
                        
                        if ([value conformsToProtocol:@protocol(NSCoding)])
                        {
                            [encoder encodeObject:value forKey:key];
                        }else {
                            //assert(0); // crash for debug
                        }
                        
                        break;
                }
            }
        }
        if (ivars) {
            free(ivars);
        }
        
        cls = class_getSuperclass(cls);
    }
}

- (id)initWithCoder:(NSCoder *)decoder {
    
    self = [super init];
    
    if (self) {
        Class cls = [self class];
        while (cls != [NSObject class]) {
            unsigned int numberOfIvars = 0;
            Ivar* ivars = class_copyIvarList(cls, &numberOfIvars);
            
            for(const Ivar* p = ivars; p < ivars+numberOfIvars; p++)
            {
                Ivar const ivar = *p;
                const char *type = ivar_getTypeEncoding(ivar);
                const char *name = ivar_getName(ivar);
                NSString *key = [NSString stringWithUTF8String:name];
                id value = [decoder decodeObjectForKey:key];
                if (value) {
                    switch (type[0]) {
                        case _C_STRUCT_B: {
                            NSUInteger ivarSize = 0;
                            NSUInteger ivarAlignment = 0;
                            NSGetSizeAndAlignment(type, &ivarSize, &ivarAlignment);
                            NSData *data = [decoder decodeObjectForKey:key];
                            char *sourceIvarLocation = (char*)self+ ivar_getOffset(ivar);
                            [data getBytes:sourceIvarLocation length:ivarSize];
                            memcpy((char *)self + ivar_getOffset(ivar), sourceIvarLocation, ivarSize);
                        }
                            break;
                        default:
                            [self setValue:value forKey:key];
                            
                            break;
                    }
                }
            }
            
            if (ivars) {
                free(ivars);
            }
            cls = class_getSuperclass(cls);
        }
    }
    
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError **)err
{
    self = [super initWithDictionary:dict error:err];
    [self nsd_SpecialDataHandling:dict];
    return self;
}

+ (instancetype)nsd_GetModelWithDictionary:(NSDictionary *)dictionary
{
    NSError *error = nil;
    NSDBaseModel *model = [[self alloc] initWithDictionary:dictionary error:&error];
    if (error) {
        return [self new];
    }
    return model;
}

+ (NSArray*)nsd_GetModelWithArray:(NSArray *)array
{
    NSMutableArray *modelArray = [NSMutableArray new];
    for (NSDictionary * dic in array) {
        [modelArray addObject:[self nsd_GetModelWithDictionary:dic]];
    }
    return [modelArray mutableCopy];
}


- (void)nsd_SpecialDataHandling:(NSDictionary *)dictionary
{
    //解析数据时，需要特殊处理的逻辑，dictionary为单个对象对应的源数据
}
@end
