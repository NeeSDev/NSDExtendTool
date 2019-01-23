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
/**
 @brief 快速显示一个带有确定按钮的提示

 @param tips 提示文字
 @param controller 承载
 */
+(void)AlertWithTips:(NSString *)tips Tag:(__kindof UIViewController *)controller;
@end

NS_ASSUME_NONNULL_END
