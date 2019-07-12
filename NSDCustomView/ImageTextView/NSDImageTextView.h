//
//  ImageTextView.h
//  EtahShadow
//
//  Created by apple on 2019/1/2.
//  Copyright © 2019 Nee. All rights reserved.
//

@import MyLayout;

NS_ASSUME_NONNULL_BEGIN

/**
 @discussion ImageTextUnitView 的类型
 */
typedef NS_ENUM(NSInteger, NSDImageTextType) {
    NSDImageTextTypeNormal    = 0,///< 常态，Image+Text
    NSDImageTextTypeText      ,   ///< Text+Text
    NSDImageTextTypeTextImage ,///< Text + Image
};


/**
 @discussion ImageTextUnitView 的状态类型
 @discussion 属性isSelected = YES 可以和所有状态共存
 @discussion 即可以在其他状态下，是选中的
 */
typedef NS_ENUM(NSInteger, NSDImageTextStatus) {
    NSDImageTextStatusNormal    = 0,///< 正常状态
    NSDImageTextStatusHighlight ,///< 高亮状态
    NSDImageTextStatusSelected ,///< 被选中状态
    NSDImageTextStatusDisable ,///< 不可用状态
};

/**
 @discussion Image+Text或者Text+Text单元view
 */
@interface NSDImageTextView : MyLinearLayout

/**
 @brief 是否开启高亮
 @discussion 默认开启
 */
@property(nonatomic,assign)BOOL nsd_IsEnableHighlight;

/**
 @brief 状态 ImageTextStatus
 */
@property(nonatomic,assign)NSDImageTextStatus nsd_ImageTextStatus;

/**
 @brief 初始化,一定要用该方法初始化

 @param orientation 布局方向 MyOrientation
 @param imageTextType 类型 ImageTextType
 @return ImageTextUnitView
 */
+(instancetype)nsd_LinearLayoutWithOrientation:(MyOrientation)orientation
                                 ImageTextType:(NSDImageTextType)imageTextType;
/**
 @brief 设置图片以及尺寸
 @discussion ImageTextTypeNormal才有用
 
 @param imageName 图片名称
 @param imageSize 图片尺寸
 */
-(void)nsd_SetImageNamed:(NSString *)imageName
               ImageSize:(CGSize)imageSize;

/**
 @brief 设置sub内容与样式
 
 @param subText subText
 @param font 字体
 @param textColor 字体颜色
 */
-(void)nsd_SetSubText:(NSString *)subText
                 Font:(UIFont *)font
            TextColor:(UIColor *)textColor;

/**
 @brief 设置选中时的图片和字体颜色
 
 @param highlightImageName 图片名称
 @param highlightSubTextColor 字体颜色
 */
-(void)nsd_SetHighlightImageNamed:(NSString *)highlightImageName
            HighlightSubTextColor:(UIColor *)highlightSubTextColor;

/**
 @brief 设置选中时的图片和字体颜色
 
 @param selectedImageName 图片名称
 @param selectedSubTextColor 字体颜色
 */
-(void)nsd_SetSelectedImageNamed:(NSString *)selectedImageName
            SelectedSubTextColor:(UIColor *)selectedSubTextColor;

/**
 @brief 设置无效时的图片
 
 @param disableImageName 图片名称
 @param disableSubTextColor 字体颜色
 */
-(void)nsd_SetDisableImageNamed:(NSString *)disableImageName
            DisableSubTextColor:(UIColor *)disableSubTextColor;

/**
 @brief 设置title内容与样式

 @param titleText titleText
 @param font 字体
 @param textColor 字体颜色
 */
-(void)nsd_SetTitleText:(NSString *)titleText
                   Font:(UIFont *)font
              TextColor:(UIColor *)textColor;

/**
 @brief 设置点击block

 @param clicked NoParamBlock
 */
-(void)nsd_SetClickedBlock:(void(^)(void))clicked;

/**
 设置状态

 @param imageTextStatus ImageTextStatus
 */
-(void)nsd_SetImageTextStatus:(NSDImageTextStatus)imageTextStatus;

@end

NS_ASSUME_NONNULL_END
