//
//  UIView+NSDQuickCoding.h
//  NeeSUIKitCategory
//
//  Created by apple on 2019/1/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 @discussion UIView + NSDQuickCoding 操作返回状态
 */
typedef NS_ENUM(NSInteger, NSDQuickViewStatus ) {
    NSDQuickViewStatusError = 0,///< 错误
    NSDQuickViewStatusSuccess,///< 操作成功
    NSDQuickViewStatusYES,///< 相当于BOOL YES
    NSDQuickViewStatusNO,///< 相当于BOOL NO

    NSDQuickViewStatusSuperviewNone,///< 没有superview
};

@interface UIView (NSDQuicker)

#pragma mark - ========== Class Methods ====================
/**
 @brief 快速获取透明背景的view

 @return UIView
 */
+(instancetype)nsd_GetClearColorView;
#pragma mark - ========== Instance Methods ====================
/**
 @brief 如果已经添加，从superview上移除
 
 @return YES移除成功，NO没有superview
 */
-(NSDQuickViewStatus)nsd_RemoveFromSuperView;

/**
 @brief 是否是superview

 @param superview 父视图
 @return NSDQuickViewStatus
 */
-(NSDQuickViewStatus)nsd_IsSuperiew:(UIView *)superview;

/**
 @brief 快速设置圆角以及边线
 
 @param cornerRadius 圆角
 @param borderWidth 边线宽
 @param borderColor 边线颜色
 @return NSDQuickViewStatus
 */
-(NSDQuickViewStatus)nsd_SetCornerRadius:(float)cornerRadius
                             BorderWidth:(float)borderWidth
                             borderColor:(UIColor *)borderColor;

/**
 @brief 快速设置圆角以及边线
 
 @param width 宽度
 @param lineLength 长度，0默认和自己一样长
 @param lineColor 边线颜色
 @return NSDQuickViewStatus
 */
-(NSDQuickViewStatus)nsd_SetBottomLineWithWidth:(float)width
                                     LineLength:(float)lineLength
                                      LineColor:(UIColor*)lineColor;
@end

NS_ASSUME_NONNULL_END