//
//  UITextField+NSDQuicker.h
//  NSDExtendTools
//
//  Created by apple on 2019/1/24.
//  Copyright © 2019 NeeSDev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (NSDQuicker)

/**
 @brief 设置左边文字位置

 @param space 偏移量
 */
+(instancetype)nsd_GetWithLeftSpace:(float)space
                      ReturnKeyType:(UIReturnKeyType)returnKeyType
                           Delegate:(nullable id)delegate;
@end

NS_ASSUME_NONNULL_END
