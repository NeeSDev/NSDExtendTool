//
//  UIButton+CustomInitFunc.h
//  recordScore
//
//  Created by NWDeveloper on 2018/12/4.
//  Copyright © 2018年 ballteam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @brief UIButton快速coding初始化
 */
@interface UIButton (NSDQuickCoding)


/**
 @brief 快速初始化一个Button
 
 @param target 方法调用对象
 @param action 响应方法
 @param backgroundImageName 背景图
 @return Button
 */
+(instancetype)nsd_GetWithTarget:(id)target
                          action:(SEL)action
             backgroundImageName:(NSString *)backgroundImageName;

/**
 @brief 快速初始化一个Button(有title)
 
 @param target 方法调用对象
 @param action 响应方法
 @param title 标题
 @param font 标题字体
 @param titleColor 标题文字颜色
 @param backgroundImageName 背景图
 @return Button
 */
+(instancetype)nsd_GetWithTarget:(id)target
                          action:(SEL)action
                           Title:(NSString *)title
                            Font:(UIFont *)font
                      TitleColor:(UIColor *)titleColor
             backgroundImageName:(NSString *)backgroundImageName;

/**
 @brief 快速初始化一个Button
 
 @param target 方法调用对象
 @param action 响应方法
 @param backgroundColor 按钮背景色
 @return Button
 */
+(instancetype)nsd_GetWithTarget:(id)target
                          action:(SEL)action
                 backgroundColor:(UIColor *)backgroundColor;

/**
 @brief 快速初始化一个Button(有title)
 
 @param target 方法调用对象
 @param action 响应方法
 @param title 标题
 @param font 标题字体
 @param titleColor 标题文字颜色
 @param backgroundColor 按钮背景色
 @return Button
 */
+(instancetype)nsd_GetWithTarget:(id)target
                          action:(SEL)action
                           Title:(NSString *)title
                            Font:(UIFont *)font
                      TitleColor:(UIColor *)titleColor
                 backgroundColor:(UIColor *)backgroundColor;

/**
 @brief 设置按钮文字
 
 @param title normal
 */
-(void)nsd_SetNormalTitle:(NSString *)title;

/**
 @brief 设置按钮文字颜色
 
 @param titleColor normal
 */
-(void)nsd_SetNormalTitleColor:(UIColor *)titleColor;

/**
 @brief 设置按钮文字

 @param title normal
 @param font font
 @param titleColor titleColor
 */
-(void)nsd_SetNormalTitle:(NSString *)title
                     Font:(UIFont *)font
               TitleColor:(UIColor *)titleColor;


/**
 @brief 设置按钮文字

 @param title selected
 */
-(void)nsd_SetSelectedTitle:(NSString *)title;


/**
 @brief 设置按钮文字颜色
 
 @param titleColor selected
 */
-(void)nsd_SetSelectedTitleColor:(UIColor *)titleColor;

/**
 @brief 设置按钮文字
 
 @param title selected
 @param font font
 @param titleColor titleColor
 */
-(void)nsd_SetSelectedTitle:(NSString *)title
                       Font:(UIFont *)font
                 TitleColor:(UIColor *)titleColor;

/**
 @brief 设置一般状态的图片
 
 @param imageName 图片名称
 */
-(void)nsd_SetNormalImageWithImageName:(NSString *)imageName;


/**
 @brief 设置选中状态的图片
 
 @param imageName 图片名称
 */
-(void)nsd_SetSelectedImageWithImageName:(NSString *)imageName;

/**
 @brief 设置高亮时的图片

 @param imageName 图片名称
 */
-(void)nsd_SetHightlightImageWithImageName:(NSString *)imageName;
@end

NS_ASSUME_NONNULL_END
