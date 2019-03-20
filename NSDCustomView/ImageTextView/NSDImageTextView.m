//
//  ImageTextView.m
//  EtahShadow
//
//  Created by apple on 2019/1/2.
//  Copyright © 2019 Nee. All rights reserved.
//

#import "NSDImageTextView.h"

@interface NSDImageTextView()
/**
 @brief 点击回调block
 */
@property(nonatomic,copy) void (^clicked)(void);

/**
 @brief 布局类型
 */
@property(nonatomic,assign)NSDImageTextType imageTextType;

/**
 @brief titlelabel
 @discussion ImageTextType 为ImageTextTypeText情况下有用
 */
@property(nonatomic,strong) UILabel *nsd_MainLabel;

/**
 @brief nsd_SubLabel
 */
@property(nonatomic,strong) UILabel *nsd_SubLabel;

/**
 @brief 图片view
 @discussion ImageTextType 为ImageTextTypeNormal情况下有用
 */
@property(nonatomic,strong) UIImageView *nsd_ImageView;


/**
 @brief 常态image
 @discussion ImageTextTypeNormal情况下
 */
@property(nonatomic,copy) NSString *nsd_NormalImageName;
/**
 @brief 选中image
 @discussion ImageTextTypeNormal情况下
 */
@property(nonatomic,copy) NSString *nsd_SelectedImageName;
/**
 @brief 高亮image
 @discussion ImageTextTypeNormal、ImageTextModelHighlight情况下
 */
@property(nonatomic,copy) NSString *nsd_HighlightImageName;
/**
 @brief 不可用image
 */
@property(nonatomic,copy)NSString *nsd_DisableImageName;

/**
 @brief 常态nsd_SubLabelColor
 */
@property(nonatomic,strong)UIColor *nsd_SubNormalColor;
/**
 @brief 选中nsd_SubLabelColor
 */
@property(nonatomic,strong)UIColor *nsd_SubSelectedColor;
/**
 @brief 高亮nsd_SubLabelColor
 @discussion ImageTextModelHighlight情况下
 */
@property(nonatomic,strong)UIColor *nsd_SubHighlightColor;
/**
 @brief 不可用nsd_SubLabelColor
*/
@property(nonatomic,strong)UIColor *nsd_SubDisableColor;

@end


@implementation NSDImageTextView
+(instancetype)nsd_LinearLayoutWithOrientation:(MyOrientation)orientation
                                 ImageTextType:(NSDImageTextType)imageTextType
{
    NSDImageTextView *layout = [super linearLayoutWithOrientation:orientation];
    layout.gravity = MyGravity_Center;
    
    if (imageTextType == NSDImageTextTypeTextImage) {
        [layout addSubview:layout.nsd_SubLabel];
        
        switch (orientation) {
            case MyOrientation_Horz:
                layout.nsd_ImageView.myLeading = 8;
                break;
            case MyOrientation_Vert:
                layout.nsd_ImageView.myTop = 8;
                break;
            default:
                break;
        }
        [layout addSubview:layout.nsd_ImageView];
    }
    else
    {
        switch (imageTextType) {
            case NSDImageTextTypeNormal:
                [layout addSubview:layout.nsd_ImageView];
                break;
            case NSDImageTextTypeText:
                [layout addSubview:layout.nsd_MainLabel];
                break;
            default:
                break;
        }
        
        switch (orientation) {
            case MyOrientation_Horz:
                layout.nsd_SubLabel.myLeading = 8;
                break;
            case MyOrientation_Vert:
                layout.nsd_SubLabel.myTop = 8;
                break;
            default:
                break;
        }
        [layout addSubview:layout.nsd_SubLabel];
    }
    layout.nsd_ImageTextStatus = NSDImageTextStatusNormal;
    layout.nsd_IsEnableHighlight = YES;
    return layout;
}

#pragma mark - ========== getter ====================
-(UILabel *)nsd_MainLabel
{
    if (_nsd_MainLabel == nil) {
        _nsd_MainLabel = [UILabel new];
    }
    return _nsd_MainLabel;
}

-(UILabel *)nsd_SubLabel
{
    if (_nsd_SubLabel == nil) {
        _nsd_SubLabel = [UILabel new];
    }
    return _nsd_SubLabel;
}

-(UIImageView *)nsd_ImageView
{
    if (_nsd_ImageView == nil) {
        _nsd_ImageView = [UIImageView new];
        _nsd_ImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _nsd_ImageView;
}

#pragma mark - ========== setter ====================
-(void)nsd_SetImageNamed:(NSString *)imageName
               ImageSize:(CGSize)imageSize
{
    self.nsd_NormalImageName = imageName;
    
    self.nsd_ImageView.image = [UIImage imageNamed:self.nsd_NormalImageName];
    self.nsd_ImageView.mySize = imageSize;
}

-(void)nsd_SetSubText:(NSString *)subText
                 Font:(UIFont *)font
            TextColor:(UIColor *)textColor
{
    self.nsd_SubNormalColor = textColor;
    self.nsd_SubLabel.text = subText;
    self.nsd_SubLabel.font = font;
    self.nsd_SubLabel.textColor = textColor;
    [self.nsd_SubLabel sizeToFit];
}

-(void)nsd_SetHighlightImageNamed:(NSString *)highlightImageName
            HighlightSubTextColor:(UIColor *)highlightSubTextColor
{
    self.nsd_HighlightImageName = highlightImageName;
    self.nsd_SubHighlightColor = highlightSubTextColor;
}

-(void)nsd_SetSelectedImageNamed:(NSString *)selectedImageName
            SelectedSubTextColor:(UIColor *)selectedSubTextColor
{
    self.nsd_SelectedImageName = selectedImageName;
    self.nsd_SubSelectedColor = selectedSubTextColor;
}

-(void)nsd_SetDisableImageNamed:(NSString *)disableImageName
            DisableSubTextColor:(UIColor *)disableSubTextColor
{
    self.nsd_DisableImageName = disableImageName;
    self.nsd_SubDisableColor = disableSubTextColor;
}

-(void)nsd_SetTitleText:(NSString *)titleText
                   Font:(UIFont *)font
              TextColor:(UIColor *)textColor
{
    self.nsd_MainLabel.text = titleText;
    self.nsd_MainLabel.font = font;
    self.nsd_MainLabel.textColor = textColor;
    [self.nsd_MainLabel sizeToFit];
}

-(void)nsd_SetClickedBlock:(void (^)(void))clicked
{
    self.clicked = clicked;
}

/**
 @brief 设置为正常状态
 */
-(void)nsd_SetNormalStatus
{
    if (_nsd_ImageView) {
        _nsd_ImageView.image = [UIImage imageNamed:_nsd_NormalImageName];
    }
    else{
        
    }
    _nsd_SubLabel.textColor = _nsd_SubNormalColor;
}

/**
 @brief 设置为选中状态
 */
-(void)nsd_SetSelectedStatus
{
    if (_nsd_ImageView) {
        _nsd_ImageView.image = [UIImage imageNamed:_nsd_SelectedImageName];
    }
    else{
        
    }
    _nsd_SubLabel.textColor = _nsd_SubSelectedColor;
}

/**
 @brief 设置为高亮状态
 @discussion 如果没有highlightImage用selected代替
 */
-(void)nsd_SetHighlightStatus
{
    NSString *hightlightImage = _nsd_NormalImageName;
    UIColor *textColor = _nsd_SubNormalColor;
    if (_nsd_HighlightImageName) {
        hightlightImage = _nsd_HighlightImageName;
        textColor = _nsd_SubHighlightColor;
    }
    else if (_nsd_SelectedImageName)
    {
        hightlightImage = _nsd_SelectedImageName;
        textColor = _nsd_SubSelectedColor;
    }
    
    if (_nsd_ImageView) {
        _nsd_ImageView.image = [UIImage imageNamed:hightlightImage];
    }
    else{
        
    }
    _nsd_SubLabel.textColor = textColor;
}

/**
 @brief 设置为不可用状态
 */
-(void)nsd_SetDisableStatus
{
    if (_nsd_ImageView) {
        _nsd_ImageView.image = [UIImage imageNamed:_nsd_DisableImageName];
    }
    else{
        
    }
    _nsd_SubLabel.textColor = _nsd_SubDisableColor;
}

-(void)nsd_SetImageTextStatus:(NSDImageTextStatus)imageTextStatus
{
    _nsd_ImageTextStatus = imageTextStatus;
    switch (imageTextStatus) {
        case NSDImageTextStatusNormal:
            [self nsd_SetNormalStatus];
            break;
        case NSDImageTextStatusHighlight:
            [self nsd_SetHighlightStatus];
            break;
        case NSDImageTextStatusSelected:
            [self nsd_SetSelectedStatus];
            break;
        case NSDImageTextStatusDisable:
            [self nsd_SetDisableStatus];
            break;
        default:
            break;
    }
}


#pragma mark - ========== response ====================
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.nsd_ImageTextStatus == NSDImageTextStatusDisable) {
        return;
    }
    
    if(self.nsd_IsEnableHighlight)
        [self nsd_SetHighlightStatus];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.nsd_ImageTextStatus == NSDImageTextStatusDisable) {
        return;
    }
    
    if(self.nsd_IsEnableHighlight)
    {
        UITouch * touch = touches.anyObject;
        CGPoint locP = [touch locationInView:touch.view];
        
        //如果是高亮模式
        //根据是否在可点击范围内设置状态
        if(![self pointInside:locP withEvent:event])
        {
            [self nsd_SetNormalStatus];
        }
        else{
            [self nsd_SetHighlightStatus];
        }
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.nsd_ImageTextStatus == NSDImageTextStatusDisable) {
        return;
    }
    
    UITouch * touch = touches.anyObject;
    CGPoint locP = [touch locationInView:touch.view];
    
    ///如果是高亮模式
    ///还原状态
    if(self.nsd_IsEnableHighlight)
    {
        [self nsd_SetImageTextStatus:self.nsd_ImageTextStatus];
    }
    
    ///如果在点击范围内
    if([self pointInside:locP withEvent:event])
    {
        ///点击响应
        if (self.clicked) {
            self.clicked();
        }
    }

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
