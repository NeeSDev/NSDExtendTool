//
//  YQImageCompressTool.m
//  compressTest
//
//  Created by problemchild on 16/7/7.
//  Copyright © 2016年 ProblenChild. All rights reserved.
//

#import "UIImage+NSDCompress.h"

@implementation UIImage (NSDCompress)

#pragma mark --------前台压缩（可能比较慢，造成当前进程卡住）
//------压缩得到 目标大小的 图片Data
-(NSData *)nsd_GetDataWithCompressToShowSize:(CGSize)ShowSize
                                    FileSize:(NSInteger)FileSize
{
    NSLog(@"正在压缩图片...");    
    UIImage *thumIMG = [self nsd_GetImageWithResizeToSize:ShowSize Scale:NO];
    
    NSData  *outIMGData = [thumIMG nsd_GetDataWithOnlyCompressToFileSize:(FileSize*1024)];
    
    CGSize scalesize = ShowSize;
    
    //如果压缩后还是无法达到文件大小，则降低分辨率，继续压缩
    while (outIMGData.length>(FileSize*1024)) {
        
        scalesize = CGSizeMake(scalesize.width*0.8, scalesize.height*0.8);
        
        thumIMG = [self nsd_GetImageWithResizeToSize:scalesize
                                               Scale:NO];
        
        outIMGData = [thumIMG nsd_GetDataWithOnlyCompressToFileSize:(FileSize*1024)];
    }
    NSLog(@"压缩完成");
    return outIMGData;
}

//------压缩得到 目标大小的 UIImage
-(UIImage *)nsd_GetImageWithCompressToShowSize:(CGSize)ShowSize
                                      FileSize:(NSInteger)FileSize
{
    NSLog(@"正在压缩图片...");
    UIImage *thumIMG = [self nsd_GetImageWithResizeToSize:ShowSize Scale:NO];
    
    UIImage *outIMG = [thumIMG nsd_GetImageWithOnlyCompressToFileSize:(FileSize*1024)];
    
    NSData * newimageData = UIImageJPEGRepresentation(outIMG,1);
    CGSize scalesize = ShowSize;
    
    //如果压缩后还是无法达到文件大小，则降低分辨率，继续压缩
    while ([newimageData length]>(FileSize*1024)) {
        
        scalesize = CGSizeMake(scalesize.width*0.8, scalesize.height*0.8);
        
        thumIMG = [self nsd_GetImageWithResizeToSize:scalesize
                                               Scale:NO];
        
        outIMG = [thumIMG nsd_GetImageWithOnlyCompressToFileSize:(FileSize*1024)];
        
        newimageData = UIImageJPEGRepresentation(outIMG,1);
        
    }
    NSLog(@"压缩完成");
    return outIMG;
}


#pragma mark --------后台压缩（异步进行，不会卡住前台进程）

// 后台压缩得到 目标大小的 图片Data
-(void)nsd_GetDataAtBackgroundWithCompressToShowSize:(CGSize)ShowSize
                                            FileSize:(NSInteger)FileSize
                                               block:(void(^)(NSData *))DataBlock
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *newIMGData = [self nsd_GetDataWithCompressToShowSize:ShowSize
                                                            FileSize:FileSize];
        DataBlock(newIMGData);
    });
}



//后台压缩得到 目标大小的 UIImage
-(void)nsd_GetImageAtBackgroundWithCompressToShowSize:(CGSize)ShowSize
                                             FileSize:(NSInteger)FileSize
                                                block:(void(^)(UIImage *))ImgBlock
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *newIMG = [self nsd_GetImageWithCompressToShowSize:ShowSize
                                                          FileSize:FileSize];
        ImgBlock(newIMG);
    });
}


#pragma mark --------细化调用方法
//------只压不缩--返回UIImage
//优点：不影响分辨率，不太影响清晰度
//缺点：存在最小限制，可能压不到目标大小
- (UIImage *)nsd_GetImageWithOnlyCompressToFileSize:(NSInteger)FileSize
{
    
    CGFloat compression    = 0.9f;
    CGFloat minCompression = 0.01f;
    NSData *imageData = UIImageJPEGRepresentation(self,
                                                  compression);
    
    //每次减少的比例
    float scale = 0.1;
    
    //新UIImage的Data
    NSData * newimageData = UIImageJPEGRepresentation(self,1);
    
    //循环条件：没到最小压缩比例，且没压缩到目标大小
    while ((compression > minCompression)&&
           (newimageData.length>FileSize))
    {
        imageData = UIImageJPEGRepresentation(self,
                                              compression);
        UIImage *compressedImage = [UIImage imageWithData:imageData];
        newimageData= UIImageJPEGRepresentation(compressedImage,1);
        
        compression -= scale;
    }
    UIImage *compressedImage = [UIImage imageWithData:newimageData];
    return compressedImage;
}

//------只压不缩--按NSData大小压缩，返回NSData
- (NSData *)nsd_GetDataWithOnlyCompressToFileSize:(NSInteger)FileSize
{
    CGFloat compression    = 1.0f;
    CGFloat minCompression = 0.001f;
    NSData *imageData = UIImageJPEGRepresentation(self,
                                                  compression);
    //每次减少的比例
    float scale = 0.1;
    
    //循环条件：没到最小压缩比例，且没压缩到目标大小
    while ((compression > minCompression)&&
           (imageData.length>FileSize))
    {
        compression -= scale;
        imageData = UIImageJPEGRepresentation(self,
                                              compression);
    }
    return imageData;
}



//------只缩不压
//若Scale为YES，则原图会根据Size进行拉伸-会变形
//若Scale为NO，则原图会根据Size进行填充-不会变形
-(UIImage *)nsd_GetImageWithResizeToSize:(CGSize)Size
                                   Scale:(BOOL)Scale
{
    UIGraphicsBeginImageContextWithOptions(Size, NO, 0.0);
    
    CGRect rect = CGRectMake(0,
                             0,
                             Size.width,
                             Size.height);
    if (!Scale) {
        
        CGFloat bili_imageWH = self.size.width/
                               self.size.height;
        CGFloat bili_SizeWH  = Size.width/Size.height;
        
        if (bili_imageWH > bili_SizeWH) {
            
            CGFloat bili_SizeH_imageH = Size.height/
                                        self.size.height;
            CGFloat height = self.size.height*
                             bili_SizeH_imageH;
            CGFloat width = height * bili_imageWH;
            CGFloat x = -(width - Size.width)/2;
            CGFloat y = 0;
            rect = CGRectMake(x,y,
                              width,
                              height);
            
        }else{
            
            CGFloat bili_SizeW_imageW = Size.width/
                                        self.size.width;
            CGFloat width = self.size.width *
                            bili_SizeW_imageW;
            CGFloat height = width / bili_imageWH;
            CGFloat x = 0;
            CGFloat y = -(height - Size.height)/2;
            rect = CGRectMake(x,y,
                              width,
                              height);
        }
    }
    
    [[UIColor clearColor] set];
    UIRectFill(rect);
    
    [self drawInRect:rect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return newImage;
}


- (UIImage *)nsd_FixOrientation {
    
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

@end
