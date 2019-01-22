//
//  FileUtil.h
//  Uoxer
//
//  Created by 黄定坤 on 5/26/16.
//  Copyright © 2016 uoxer. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @discussion 本地文件操作
 */
@interface FileUtil : NSObject

/**
 @brief 获取文档存储路径

 @return 路径
 */
+ (NSString *)documentPath;

@end
