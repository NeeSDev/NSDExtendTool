//
//  UIImageView+CustiomInitFunc.h
//  EtahShadow
//
//  Created by apple on 2018/12/29.
//  Copyright © 2018 Nee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @brief UIImage快速coding初始化
 */
@interface UIImageView (NSDQuickCoding)


/**
 根据图片名称初始化 imageview

 @param imageName 图片名称
 @return UIImageView
 */
+(instancetype)nsd_GetWithImageName:(NSString *)imageName;
@end

NS_ASSUME_NONNULL_END
