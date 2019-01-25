//
//  NDBaseViewController.h
//  recordScore
//
//  Created by NWDeveloper on 2018/12/4.
//  Copyright © 2018年 ballteam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @discussion 所有ViewController基类
 */
@interface NSDViewController : UIViewController

#pragma mark - ========== over load ====================
/**
 @brief 默认StatusBar黑色
 @discussion 子类可重写,由于项目主视图为tabbarcontroller,所以是自动调用 -setStatusBarStyle 来设置

 @return style
 */
-(UIStatusBarStyle)preferredStatusBarStyle;
#pragma mark - ========== custom ====================
/**
 @brief DescriptionUI布局,在loadView中调用
 @warning 如果通过xib或者storyBoard记载，请不要在次方法中做self.view上的布局，因为他在view加载之前先调用
 @return UIView，返回的view作为rootview，无需addsubview
 */
-(nullable __kindof UIView *)nsd_UIMaker;

/**
 @brief 设置监听
 */
-(void)nsd_NotificationRegister;

/**
 @brief 请求数据前设置基本数据
 @discussion 在UI布局完毕之后调用
 */
-(void)nsd_DataMaker;

/**
 @brief 网络数据请求
 @discussion 在本地基本数据部署之后调用
 */
-(void)nsd_DataRequester;

/**
 @brief 返回上一级controller
 */
-(void)nsd_PopController;

/**
 @brief 返回root controller
 */
-(void)nsd_PopRootController;

/**
 @brief 跳转下一级controller
 @param controller EtahViewController基类

 */
-(void)nsd_PushViewController:(__kindof NSDViewController *)controller;

#pragma mark - ========== setter ====================
/**
 @brief 设置返回按钮
 */
-(void)nsd_SetNavBackItemWithImageName:(NSString *)imageName;

/**
 @brief 设置导航栏中间title（image类型）
 
 @param imageName 图片名称
 */
-(void)nsd_SetNavTitleItemWithImageNamed:(NSString *)imageName;

/**
 @brief 设置导航栏中间title（text类型）
 
 @param title title
 @param color 文字颜色
 */
-(void)nsd_SetNavTitleItemWithText:(NSString *)title
                              Font:(UIFont *)font
                             Color:(UIColor *)color;

/**
 @brief 设置导航栏中间title（view类型）
 
 @param view UIView
 */
-(void)nsd_SetNavTitleItemWithView:(__kindof UIView *)view;

/**
 @brief 设置导航栏右键（单个text类型）
 
 @param rightText title
 @param font 字体
 @param rightSel 响应事件
 */
-(void)nsd_SetNavRightItemWithText:(NSString *)rightText
                              Font:(UIFont *)font
                          RightSel:(SEL)rightSel;

/**
 @brief 设置导航栏右键（单个text类型）

 @param rightText title
 @param font 字体
 @param color 文字颜色
 @param rightSel 响应事件
 */
-(void)nsd_SetNavRightItemWithText:(NSString *)rightText
                              Font:(UIFont *)font
                             Color:(UIColor *)color
                          RightSel:(SEL)rightSel;

/**
 @brief 设置导航栏右键（单个image类型）
 
 @param imageName 图片名称
 @param rightSel 响应事件
 */
-(void)nsd_SetNavRightItemWithImageNamed:(NSString *)imageName
                                RightSel:(SEL)rightSel;


/**
 @brief 设置导航栏
 */
-(void)nsd_SetNavBackgroudWithImageName:(nullable NSString *)imageName;


#pragma mark - ========== getter ====================
/**
 @brief 获取页面名称

 @return 页面名称
 */
-(NSString *)nsd_GetNavTitle;


/**
 @brief navigationBar背景
 @discussion nil为默认，@""空字符串为透明

 @return 用于设置navigationBar背景色
 */
-(nullable NSString *)nsd_GetNavigationBarBackImageName;

@end

NS_ASSUME_NONNULL_END
