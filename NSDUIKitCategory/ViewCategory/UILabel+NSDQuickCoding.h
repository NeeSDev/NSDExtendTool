//
//  UILabel+CustomInitFunc.h
//  recordScore
//
//  Created by NWDeveloper on 2018/12/4.
//  Copyright © 2018年 ballteam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @brief UILabel快速coding初始化
 */
@interface UILabel (NSDQuickCoding)

/**
 @brief 快速初始化一个Label
 @discussion textAlignment:NSTextAlignmentCenter
 
 @param text 文字
 @param font 字体
 @param textColor 字体颜色
 @return UILabel
 */
+(instancetype)nsd_GetWithText:(NSString *)text
                          font:(UIFont *)font
                     textColor:(UIColor *)textColor;

/**
 @brief 快速初始化一个Label
 
 @param text 文字
 @param font 字体
 @param textColor 字体颜色
 @param textAlignment 文字对齐
 @return UILabel
 */
+(instancetype)nsd_GetWithText:(NSString *)text
                          font:(UIFont *)font
                     textColor:(UIColor *)textColor
                 textAlignment:(NSTextAlignment)textAlignment;

/**
 @brief 快速初始化一个Label
 @discussion textAlignment:NSTextAlignmentCenter

 @param font 字体
 @param textColor 字体颜色
 @return UILabel
 */
+(instancetype)nsd_GetWithFont:(UIFont *)font
                     textColor:(UIColor *)textColor;

/**
 @brief 快速初始化一个Label
 
 @param font 字体
 @param textColor 字体颜色
 @param textAlignment 文字对齐
 @return UILabel
 */
+(instancetype)nsd_GetWithFont:(UIFont *)font
                     textColor:(UIColor *)textColor
                 textAlignment:(NSTextAlignment)textAlignment;
@end

NS_ASSUME_NONNULL_END
