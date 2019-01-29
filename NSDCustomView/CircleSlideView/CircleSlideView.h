//
//  CircleSlideImageView.h
//  NSDExtendTools
//
//  Created by apple on 2019/1/29.
//  Copyright © 2019 NeeSDev. All rights reserved.
//

#import "MyRelativeLayout.h"

NS_ASSUME_NONNULL_BEGIN

/**
 @discussion 循环播放图片
 */
@interface CircleSlideView : MyRelativeLayout


/**
 @discussion 设置轮播图层

 @param viewArray 轮播图
 @param intervalTime 切换间隔
 @param isShowPage 是否显示page样式
 */
-(void)nsd_SetViews:(NSArray<__kindof UIView *> *)viewArray
       IntervalTime:(float)intervalTime
         IsShowPage:(BOOL)isShowPage;
@end

NS_ASSUME_NONNULL_END
