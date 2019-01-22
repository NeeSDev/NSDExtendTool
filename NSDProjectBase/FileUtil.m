//
//  FileUtil.m
//  Uoxer
//
//  Created by 黄定坤 on 5/26/16.
//  Copyright © 2016 uoxer. All rights reserved.
//

#import "FileUtil.h"

@implementation FileUtil

+ (NSString *)documentPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

@end
