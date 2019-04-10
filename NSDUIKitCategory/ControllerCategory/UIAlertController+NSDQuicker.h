//
//  UIAlertController+NSDQuicker.h
//  NSDExtendTools
//
//  Created by apple on 2019/1/23.
//  Copyright © 2019 NeeSDev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (NSDQuicker)

#pragma mark - ========== 一个按钮 ====================
/**
 @brief 快速显示一个UIAlertController
 @discussion 一个按钮，可自定义按钮文字

 @param title 标题title
 @param tips 提示文字
 @param controller 承载
 @param confirmText 按钮文字
 @param confirmBlock 按钮回调
 */
+(void)nsd_AlertWithTitle:(nullable NSString *)title
                     Tips:(NSString *)tips
                      Tag:(__kindof UIViewController *)controller
              ConfirmText:(NSString *)confirmText
             ConfirmBlock:(nullable void(^)(void))confirmBlock;

/**
 @brief 快速显示一个UIAlertController
 @discussion 一个按钮，默认按钮文字是“确定”
 
 @param title 标题title
 @param tips 提示文字
 @param controller 承载
 @param confirmBlock 按钮回调
 */
+(void)nsd_AlertWithTitle:(nullable NSString *)title
                     Tips:(NSString *)tips
                      Tag:(__kindof UIViewController *)controller
             ConfirmBlock:(nullable void(^)(void))confirmBlock;

#pragma mark - ========== 两个按钮 ====================
/**
 @brief 快速显示一个UIAlertController
 @discussion 两个按钮，可自定义按钮文字
 
 @param title 标题
 @param tips 提示文字
 @param controller 承载
 @param confirmText 确认按钮文字
 @param cancelText 取消按钮文字
 @param confirmBlock 确认回调
 @param cancelBlock 取消回调
 */
+(void)nsd_AlertWithTitle:(nullable NSString *)title
                     Tips:(NSString *)tips
                      Tag:(__kindof UIViewController *)controller
              ConfirmText:(NSString *)confirmText
               CancelText:(NSString *)cancelText
             ConfirmBlock:(nullable void(^)(void))confirmBlock
              CancelBlock:(nullable void(^)(void))cancelBlock;

/**
 @brief 快速显示一个UIAlertController
 @discussion 两个按钮，默认确认按钮文字是“确定”，取消按钮文字是“取消”

 @param title 标题
 @param tips 提示文字
 @param controller 承载
 @param confirmBlock 确认回调
 @param cancelBlock 取消回调
 */
+(void)nsd_AlertWithTitle:(nullable NSString *)title
                     Tips:(NSString *)tips
                      Tag:(__kindof UIViewController *)controller
             ConfirmBlock:(nullable void(^)(void))confirmBlock
              CancelBlock:(nullable void(^)(void))cancelBlock;



@end

NS_ASSUME_NONNULL_END
