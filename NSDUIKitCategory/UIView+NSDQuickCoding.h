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

@interface UIView (NSDQuickCoding)

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
 @return <#return value description#>
 */
-(NSDQuickViewStatus)nsd_IsSuperiew:(UIView *)superview;
@end

NS_ASSUME_NONNULL_END
