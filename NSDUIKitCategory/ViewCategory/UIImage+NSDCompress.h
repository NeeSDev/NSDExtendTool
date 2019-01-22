//
//  YQImageCompressTool.h
//  compressTest
//
//  Created by problemchild on 16/7/7.
//  Copyright © 2016年 ProblenChild. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 @brief UIImage压缩
 */
@interface UIImage (NSDCompress)

#pragma mark --------前台压缩（可能比较慢，造成当前进程卡住）
/**
 @brief 压缩得到 目标大小的 图片Data

 @param ShowSize 将要显示的分辨率
 @param FileSize 文件大小限制
 @return 压缩得到的图片Data
 */
-(NSData *)nsd_GetDataWithCompressToShowSize:(CGSize)ShowSize
                                    FileSize:(NSInteger)FileSize;
/**
 @brief 压缩得到 目标大小的 图片Data
 
 @param ShowSize 将要显示的分辨率
 @param FileSize 文件大小限制
 @return 压缩得到的UIImage
 */
-(UIImage *)nsd_GetImageWithCompressToShowSize:(CGSize)ShowSize
                                      FileSize:(NSInteger)FileSize;

#pragma mark --------后台压缩（异步进行，不会卡住前台进程）

/**
 @brief 后台压缩得到 目标大小的 图片Data
 @discussion 使用block的结果，记得按需获取主线程
 
 @param ShowSize  将要显示的分辨率
 @param FileSize  文件大小限制
 @param DataBlock 压缩成功后返回的block
 */
-(void)nsd_GetDataAtBackgroundWithCompressToShowSize:(CGSize)ShowSize
                                            FileSize:(NSInteger)FileSize
                                               block:(void(^)(NSData *data))DataBlock;


/**
 @brief 后台压缩得到 目标大小的 UIImage
 @discussion 使用block的结果，记得按需获取主线程
 
 @param ShowSize 将要显示的分辨率
 @param FileSize 文件大小限制
 @param ImgBlock 压缩成功后返回的block
 */
-(void)nsd_GetImageAtBackgroundWithCompressToShowSize:(CGSize)ShowSize
                                             FileSize:(NSInteger)FileSize
                                                block:(void(^)(UIImage *image))ImgBlock;

#pragma mark --------细化调用方法
/**
 @brief ------只压不缩--按UIImage大小压缩，返回UIImage
 @discussion 优点：不影响分辨率，不太影响清晰度
 @discussion 缺点：存在最小限制，可能压不到目标大小

 @param FileSize 文件大小限制
 @return UIImage
 */
- (UIImage *)nsd_GetImageWithOnlyCompressToFileSize:(NSInteger)FileSize;

/**
 @brief ------只压不缩--按NSData大小压缩，返回NSData
 @discussion 优点：不影响分辨率，不太影响清晰度
 @discussion 缺点：存在最小限制，可能压不到目标大小
 
 @param FileSize 文件大小限制
 @return NSData
 */
- (NSData *)nsd_GetDataWithOnlyCompressToFileSize:(NSInteger)FileSize;

/**
 @brief ------只缩不压
 @discussion 优点：可以大幅降低容量大小
 @discussion 缺点：影响清晰度
 @discussion 若Scale为YES，则原图会根据Size进行拉伸-会变形
 @discussion 若Scale为NO，则原图会根据Size进行填充-不会变形

 @param Size 尺寸
 @param Scale 是否缩放
 @return UIImage
 */
-(UIImage *)nsd_GetImageWithResizeToSize:(CGSize)Size
                                   Scale:(BOOL)Scale;


@end
