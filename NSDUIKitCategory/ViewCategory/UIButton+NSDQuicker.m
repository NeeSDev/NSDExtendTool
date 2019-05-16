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
                    Color:(UIColor *)titleColor
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
                      Color:(UIColor *)titleColor
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
