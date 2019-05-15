//
//  UIButton+CustomInitFunc.m
//  recordScore
//
//  Created by NWDeveloper on 2018/12/4.
//  Copyright © 2018年 ballteam. All rights reserved.
//

#import "UIButton+NSDQuicker.h"
#import "ReactiveObjC.h"

@implementation UIButton (NSDQuicker)

#pragma mark - ========== 初始化 block ====================
+(instancetype)nsd_GetBlockButtonWithBackgroundImageName:(NSString *)backgroundImageName
                                                  Action:(void(^)(void))action
{
    UIButton *btn =[self buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn nsd_SetNormalBackgroundImageWithImageName:backgroundImageName];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        action();
    }];
    return btn;
}

+(instancetype)nsd_GetBlockButtonWithBackgroundImageName:(NSString *)backgroundImageName
                                                   Title:(NSString *)title
                                                    Font:(UIFont *)font
                                              TitleColor:(UIColor *)titleColor
                                                  Action:(void(^)(void))action
{
    UIButton *btn =[self nsd_GetBlockButtonWithBackgroundImageName:backgroundImageName
                                                                Action:action];
    [btn nsd_SetNormalTitle:title];
    [btn nsd_SetNormalTitleColor:titleColor];
    btn.titleLabel.font = font;
    return btn;
}

+(instancetype)nsd_GetBlockButtonWithImageName:(NSString *)imageName
                                        Action:(void(^)(void))action
{
    UIButton *btn =[self buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn nsd_SetNormalImageWithImageName:imageName];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        action();
    }];
    return btn;
}

+(instancetype)nsd_GetBlockButtonWithImageName:(NSString *)imageName
                                         Title:(NSString *)title
                                          Font:(UIFont *)font
                                    TitleColor:(UIColor *)titleColor
                                        Action:(void(^)(void))action
{
    UIButton *btn =[self nsd_GetBlockButtonWithImageName:imageName
                                                      Action:action];
    [btn nsd_SetNormalTitle:title];
    [btn nsd_SetNormalTitleColor:titleColor];
    btn.titleLabel.font = font;
    return btn;
}

+(instancetype)nsd_GetBlockButtonWithBackgroundColor:(UIColor *)backgroundColor
                                              Action:(void(^)(void))action
{
    UIButton *btn =[self buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn setBackgroundColor:backgroundColor];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        action();
    }];
    return btn;
}

+(instancetype)nsd_GetBlockButtonWithBackgroundColor:(UIColor *)backgroundColor
                                               Title:(NSString *)title
                                                Font:(UIFont *)font
                                          TitleColor:(UIColor *)titleColor
                                              Action:(void(^)(void))action
{
    UIButton *btn =[self nsd_GetBlockButtonWithBackgroundColor:backgroundColor
                                                            Action:action];
    [btn nsd_SetNormalTitle:title];
    [btn nsd_SetNormalTitleColor:titleColor];
    btn.titleLabel.font = font;
    
    return btn;
}

#pragma mark - ========== 初始化 sel ====================
+(instancetype)nsd_GetSelButtonWithBackgroundImageName:(NSString *)backgroundImageName
                                                Target:(id)target
                                                Action:(SEL)action
{
    UIButton *btn =[self buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn nsd_SetNormalBackgroundImageWithImageName:backgroundImageName];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

+(instancetype)nsd_GetSelButtonWithBackgroundImageName:(NSString *)backgroundImageName
                                                 Title:(NSString *)title
                                                  Font:(UIFont *)font
                                            TitleColor:(UIColor *)titleColor
                                                Target:(id)target
                                                Action:(SEL)action
{
    UIButton *btn =[self nsd_GetSelButtonWithBackgroundImageName:backgroundImageName
                                                              Target:target
                                                              Action:action];
    [btn nsd_SetNormalTitle:title];
    [btn nsd_SetNormalTitleColor:titleColor];
    btn.titleLabel.font = font;
    
    return btn;
}

+(instancetype)nsd_GetSelButtonWithImageName:(NSString *)imageName
                                      Target:(id)target
                                      Action:(SEL)action
{
    UIButton *btn =[self buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn nsd_SetNormalImageWithImageName:imageName];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

+(instancetype)nsd_GetSelButtonWithImageName:(NSString *)imageName
                                       Title:(NSString *)title
                                        Font:(UIFont *)font
                                  TitleColor:(UIColor *)titleColor
                                      Target:(id)target
                                      Action:(SEL)action
{
    UIButton *btn =[self nsd_GetSelButtonWithImageName:imageName
                                                    Target:target
                                                    Action:action];
    [btn nsd_SetNormalTitle:title];
    [btn nsd_SetNormalTitleColor:titleColor];
    btn.titleLabel.font = font;
    
    return btn;
}

+(instancetype)nsd_GetSelButtonWithBackgroundColor:(UIColor *)backgroundColor
                                            Target:(id)target
                                            Action:(SEL)action
{
    UIButton *btn =[self buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn setBackgroundColor:backgroundColor];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

+(instancetype)nsd_GetSelButtonWithBackgroundColor:(UIColor *)backgroundColor
                                             Title:(NSString *)title
                                              Font:(UIFont *)font
                                        TitleColor:(UIColor *)titleColor
                                            Target:(id)target
                                            action:(SEL)action
{
    UIButton *btn =[self nsd_GetSelButtonWithBackgroundColor:backgroundColor
                                                          Target:target
                                                          Action:action];
    [btn nsd_SetNormalTitle:title];
    [btn nsd_SetNormalTitleColor:titleColor];
    btn.titleLabel.font = font;
    
    return btn;
}


#pragma mark - ========== 设置 ====================
-(void)nsd_SetNormalTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
}

-(void)nsd_SetNormalTitleColor:(UIColor *)titleColor
{
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}

-(void)nsd_SetNormalTitle:(NSString *)title
                     Font:(UIFont *)font
               TitleColor:(UIColor *)titleColor
{
    [self nsd_SetNormalTitle:title];
    [self nsd_SetNormalTitleColor:titleColor];
    self.titleLabel.font = font;
}

-(void)nsd_SetSelectedTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateSelected];
}

-(void)nsd_SetSelectedTitleColor:(UIColor *)titleColor
{
    [self setTitleColor:titleColor forState:UIControlStateSelected];
}

-(void)nsd_SetSelectedTitle:(NSString *)title
                 TitleColor:(UIColor *)titleColor
{
    [self nsd_SetSelectedTitle:title];
    [self nsd_SetSelectedTitleColor:titleColor];
}

-(void)nsd_SetNormalBackgroundImageWithImageName:(NSString *)imageName
{
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

-(void)nsd_SetSelectedBackgroundImageWithImageName:(NSString *)imageName
{
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
}

-(void)nsd_SetHightlightBackgroundImageWithImageName:(NSString *)imageName
{
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
}

-(void)nsd_SetNormalImageWithImageName:(NSString *)imageName
{
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

-(void)nsd_SetSelectedImageWithImageName:(NSString *)imageName
{
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
}

-(void)nsd_SetHightlightImageWithImageName:(NSString *)imageName
{
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
}
@end
