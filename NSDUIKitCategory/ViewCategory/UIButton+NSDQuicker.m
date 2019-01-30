//
//  UIButton+CustomInitFunc.m
//  recordScore
//
//  Created by NWDeveloper on 2018/12/4.
//  Copyright © 2018年 ballteam. All rights reserved.
//

#import "UIButton+NSDQuicker.h"

@implementation UIButton (NSDQuicker)
+(instancetype)nsd_GetWithTitle:(NSString *)title
                           Font:(nonnull UIFont *)font
                          Color:(UIColor *)color;
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = font;
    [btn nsd_SetNormalTitle:title];
    [btn nsd_SetNormalTitleColor:color];
    [btn setBackgroundColor:[UIColor clearColor]];
    return btn;
}

+(instancetype)nsd_GetWithBackgroundImageName:(NSString *)backgroundImageName
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn nsd_SetNormalImageWithImageName:backgroundImageName];
    return btn;
}

+(instancetype)nsd_GetWithTarget:(id)target
                          action:(SEL)action
                 backgroundColor:(UIColor *)backgroundColor
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:backgroundColor ];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(instancetype)nsd_GetWithTarget:(id)target
                          action:(SEL)action
                           Title:(NSString *)title
                            Font:(UIFont *)font
                      TitleColor:(UIColor *)titleColor
                 backgroundColor:(UIColor *)backgroundColor
{
    UIButton *btn =[UIButton nsd_GetWithTarget:target
                                        action:action
                               backgroundColor:backgroundColor];
    [btn nsd_SetNormalTitle:title];
    btn.titleLabel.font = font;
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    return btn;
}

+(instancetype)nsd_GetWithTarget:(id)target
                          action:(SEL)action
             backgroundImageName:(NSString *)backgroundImageName
{
    UIButton *btn =[UIButton nsd_GetWithTarget:target
                                        action:action
                               backgroundColor:[UIColor clearColor]];
    [btn nsd_SetNormalImageWithImageName:backgroundImageName];
    return btn;
}

+(instancetype)nsd_GetWithTarget:(id)target
                          action:(SEL)action
                           Title:(NSString *)title
                            Font:(UIFont *)font
                      TitleColor:(UIColor *)titleColor
             backgroundImageName:(NSString *)backgroundImageName
{
    UIButton *btn =[UIButton nsd_GetWithTarget:target action:action backgroundImageName:backgroundImageName];
    [btn nsd_SetNormalTitle:title];
    [btn nsd_SetNormalTitleColor:titleColor];
    btn.titleLabel.font = font;
    return btn;
}


-(void)nsd_SetNormalTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
    [self sizeToFit];
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
                       Font:(UIFont *)font
                 TitleColor:(UIColor *)titleColor
{
    [self nsd_SetSelectedTitle:title];
    [self nsd_SetSelectedTitleColor:titleColor];
    self.titleLabel.font = font;
}

-(void)nsd_SetNormalImageWithImageName:(NSString *)imageName
{
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

-(void)nsd_SetSelectedImageWithImageName:(NSString *)imageName
{
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
}

-(void)nsd_SetHightlightImageWithImageName:(NSString *)imageName
{
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
}

@end
