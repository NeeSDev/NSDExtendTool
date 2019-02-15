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

+(void)nsd_AlertWithTips:(NSString *)tips
                     Tag:(__kindof UIViewController *)controller
             ConfirmText:(NSString *)confirmText
            ConfirmBlock:(nullable void(^)(void))confirmBlock;


+(void)nsd_AlertWithTitle:(NSString *)title
                     Tips:(NSString *)tips
                      Tag:(__kindof UIViewController *)controller
              ConfirmText:(NSString *)confirmText
             ConfirmBlock:(nullable void(^)(void))confirmBlock;

/**
 @brief 快速显示一个带有确定按钮的提示
 
 @param tips 提示文字
 @param controller 承载
 */
+(void)nsd_AlertWithTips:(NSString *)tips
                     Tag:(__kindof UIViewController *)controller;

+(void)nsd_AlertWithTips:(NSString *)tips
                     Tag:(__kindof UIViewController *)controller
            ConfirmBlock:(void(^)(void))confirmBlock;

+(void)nsd_AlertWithTips:(NSString *)tips
                     Tag:(__kindof UIViewController *)controller
             ConfirmText:(NSString *)confirmText
              CancelText:(NSString *)cancelText
            ConfirmBlock:(nullable void(^)(void))confirmBlock
             CancelBlock:(nullable void(^)(void))cancelBlock;

+(void)nsd_AlertWithTips:(NSString *)tips
                     Tag:(__kindof UIViewController *)controller
            ConfirmBlock:(nullable void(^)(void))confirmBlock
             CancelBlock:(nullable void(^)(void))cancelBlock;

+(void)nsd_AlertWithTitle:(NSString *)title
                     Tips:(NSString *)tips
                     Tag:(__kindof UIViewController *)controller
             ConfirmText:(NSString *)confirmText
              CancelText:(NSString *)cancelText
            ConfirmBlock:(nullable void(^)(void))confirmBlock
             CancelBlock:(nullable void(^)(void))cancelBlock;

+(void)nsd_AlertWithTitle:(NSString *)title
                     Tips:(NSString *)tips
                      Tag:(__kindof UIViewController *)controller
             ConfirmBlock:(nullable void(^)(void))confirmBlock
              CancelBlock:(nullable void(^)(void))cancelBlock;
@end

NS_ASSUME_NONNULL_END
