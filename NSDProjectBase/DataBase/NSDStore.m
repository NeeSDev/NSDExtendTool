//
//  StoreModel.m
//  huhu
//
//  Created by gullmei on 15/10/25.
//  Copyright © 2015年 gullmei. All rights reserved.
//

#import "NSDStore.h"
#include <objc/runtime.h>

#define  ALL_DATA_CACHE       @"all_data_cache.txt"
#define  DATA_IDENTIFY_CACHE      @"data_identify_cache.txt"

@interface NSDStore ()

/**
 @brief 当前数据标识
 */
@property (nonatomic, copy) NSString * dataIdentify;


/**
 @brief 数据 key=dataIdentify
 */
@property (nonatomic, strong) NSMutableDictionary * storeDataDic;

@end

@implementation NSDStore

+ (instancetype)nsd_SharedInstance {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _dataIdentify = @"";
        _storeDataDic = [[NSMutableDictionary alloc] init];
        _dataDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)nsd_SetCurrentDataIdentify:(NSString *)dataIdentify
{
    _dataIdentify = [dataIdentify copy];
}

-(NSString *)nsd_GetCurrentDataIdentify
{
    return [_dataIdentify copy];
}

#pragma mark - 存储
//读取
-(void)restoreData
{
    //对象反序列化
    @try {
        NSString *filePath = [self nsd_CreateFilePathWithName:DATA_IDENTIFY_CACHE];
        NSString*  tempstr = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        if(tempstr != nil)
        {
            self.dataIdentify = tempstr;
        }
        
        
        filePath = [self nsd_CreateFilePathWithName:ALL_DATA_CACHE];
        NSMutableDictionary* tempdic = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        if(tempdic != nil)
        {
            self.storeDataDic = tempdic;
            
            //有当前数据标识就一定有对应的用户数据
            if(![self.dataIdentify isEqualToString:@""])
                self.dataDic = [self.storeDataDic objectForKey:self.dataIdentify];
        }
    }
    @catch (NSException * e) {
        
    }
    @finally {
        
    }
}
//保存数据
-(void)Save
{
    //对象序列化
    @try {
        
        NSString * filePath = nil;
        
        filePath = [self nsd_CreateFilePathWithName:DATA_IDENTIFY_CACHE];
        [NSKeyedArchiver archiveRootObject:self.dataIdentify toFile:filePath];
        
        filePath = [self nsd_CreateFilePathWithName:ALL_DATA_CACHE];
        
        //更新用户数据再存储
        if(![self.dataIdentify isEqualToString:@""])
            [self.storeDataDic setObject:self.dataDic forKey:self.dataIdentify];
        
        [NSKeyedArchiver archiveRootObject:self.storeDataDic toFile:filePath];
    }
    @catch (NSException * e) {
        
    }
    @finally {
        
    }
}

- (NSString * )nsd_CreateFilePathWithName:(NSString *)name
{
    NSFileManager * manager = [NSFileManager defaultManager];
    NSString * pre = [NSDStore documentPath];
    NSString * fullPath = [NSString stringWithFormat:@"%@/contents/",pre];
    
    BOOL dir = 1;
    if (![manager fileExistsAtPath:fullPath isDirectory:&dir])
    {
        [manager createDirectoryAtPath:fullPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    fullPath = [fullPath stringByAppendingString:name];
    dir = 0;
    if (![manager fileExistsAtPath:fullPath isDirectory:&dir])
    {
        [manager createFileAtPath:fullPath contents:nil attributes:nil];
    }
    //MLOG(@"%@",fullPath);
    return fullPath;
}

+ (NSString *)documentPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}
@end
