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
@interface UIButton (NSDQuicker)


#pragma mark - ========== 初始化 block ====================
/**
 @brief 使用BackgroundImage初始化Button
 
 @param backgroundImageName 背景图
 @param action 点击回调
 
 @return Button
 */
+(instancetype)nsd_GetBlockButtonWithBackgroundImageName:(NSString *)backgroundImageName
                                                  Action:(void(^)(void))action;

/**
 @brief 使用BackgroundImage初始化Button(有title)
 
 @param backgroundImageName 背景图
 @param title 标题
 @param font 标题字体
 @param titleColor 标题文字颜色
 @param action 点击回调
 
 @return Button
 */
+(instancetype)nsd_GetBlockButtonWithBackgroundImageName:(NSString *)backgroundImageName
                                                   Title:(NSString *)title
                                                    Font:(UIFont *)font
                                              TitleColor:(UIColor *)titleColor
                                                  Action:(void(^)(void))action;

/**
 @brief 使用Image初始化Button
 
 @param imageName 图
 @param action 点击回调
 
 @return Button
 */
+(instancetype)nsd_GetBlockButtonWithImageName:(NSString *)imageName
                                        Action:(void(^)(void))action;

/**
 @brief 使用Image初始化Button(有title)
 
 @param imageName 图
 @param title 标题
 @param font 标题字体
 @param titleColor 标题文字颜色
 @param action 点击回调
 
 @return Button
 */
+(instancetype)nsd_GetBlockButtonWithImageName:(NSString *)imageName
                                         Title:(NSString *)title
                                          Font:(UIFont *)font
                                    TitleColor:(UIColor *)titleColor
                                        Action:(void(^)(void))action;

/**
 @brief 使用BackgroundColor初始化Button
 
 @param backgroundColor 背景色
 @param action 点击回调
 
 @return Button
 */
+(instancetype)nsd_GetBlockButtonWithBackgroundColor:(UIColor *)backgroundColor
                                              Action:(void(^)(void))action;

/**
 @brief 使用BackgroundColor初始化Button(有title)
 
 @param backgroundColor 按钮背景色
 @param title 标题
 @param font 标题字体
 @param titleColor 标题文字颜色
 @param action 点击回调
 
 @return Button
 */
+(instancetype)nsd_GetBlockButtonWithBackgroundColor:(UIColor *)backgroundColor
                                               Title:(NSString *)title
                                                Font:(UIFont *)font
                                          TitleColor:(UIColor *)titleColor
                                              Action:(void(^)(void))action;

#pragma mark - ========== 初始化 SEL ====================
/**
 @brief 使用BackgroundImage初始化Button
 
 @param backgroundImageName 背景图
 @param target 方法调用对象
 @param action 响应方法
 
 @return Button
 */
+(instancetype)nsd_GetSelButtonWithBackgroundImageName:(NSString *)backgroundImageName
                                                Target:(id)target
                                                Action:(SEL)action;

/**
 @brief 使用BackgroundImage初始化Button(有title)
 
 @param backgroundImageName 背景图
 @param title 标题
 @param font 标题字体
 @param titleColor 标题文字颜色
 @param target 方法调用对象
 @param action 响应方法
 
 @return Button
 */
+(instancetype)nsd_GetSelButtonWithBackgroundImageName:(NSString *)backgroundImageName
                                                 Title:(NSString *)title
                                                  Font:(UIFont *)font
                                            TitleColor:(UIColor *)titleColor
                                                Target:(id)target
                                                Action:(SEL)action;

/**
 @brief 使用Image初始化Button
 
 @param imageName 图
 @param target 方法调用对象
 @param action 响应方法
 @return Button
 */
+(instancetype)nsd_GetSelButtonWithImageName:(NSString *)imageName
                                      Target:(id)target
                                      Action:(SEL)action;

/**
 @brief 使用Image初始化Button(有title)
 
 @param imageName 图
 @param title 标题
 @param font 标题字体
 @param titleColor 标题文字颜色
 @param target 方法调用对象
 @param action 响应方法
 
 @return Button
 */
+(instancetype)nsd_GetSelButtonWithImageName:(NSString *)imageName
                                       Title:(NSString *)title
                                        Font:(UIFont *)font
                                  TitleColor:(UIColor *)titleColor
                                      Target:(id)target
                                      Action:(SEL)action;

/**
 @brief 使用BackgroundColor初始化Button
 
 @param backgroundColor 按钮背景色
 @param target 方法调用对象
 @param action 响应方法
 
 @return Button
 */
+(instancetype)nsd_GetSelButtonWithBackgroundColor:(UIColor *)backgroundColor
                                            Target:(id)target
                                            Action:(SEL)action;

/**
 @brief 使用BackgroundColor初始化Button(有title)
 
 @param backgroundColor 按钮背景色
 @param title 标题
 @param font 标题字体
 @param titleColor 标题文字颜色
 @param target 方法调用对象
 @param action 响应方法
 
 @return Button
 */
+(instancetype)nsd_GetSelButtonWithBackgroundColor:(UIColor *)backgroundColor
                                             Title:(NSString *)title
                                              Font:(UIFont *)font
                                        TitleColor:(UIColor *)titleColor
                                            Target:(id)target
                                            action:(SEL)action;
#pragma mark - ========== 设置 ====================
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
 @brief 设置选中状态的按钮文字
 
 @param title selected
 @param titleColor titleColor
 */
-(void)nsd_SetSelectedTitle:(NSString *)title
                 TitleColor:(UIColor *)titleColor;

/**
 @brief 设置一般状态的图片
 
 @param imageName 图片名称
 */
-(void)nsd_SetNormalBackgroundImageWithImageName:(NSString *)imageName;


/**
 @brief 设置选中状态的图片
 
 @param imageName 图片名称
 */
-(void)nsd_SetSelectedBackgroundImageWithImageName:(NSString *)imageName;

/**
 @brief 设置高亮时的图片
 
 @param imageName 图片名称
 */
-(void)nsd_SetHightlightBackgroundImageWithImageName:(NSString *)imageName;

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
