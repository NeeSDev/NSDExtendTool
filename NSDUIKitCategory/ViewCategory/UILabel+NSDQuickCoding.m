//
//  UILabel+CustomInitFunc.m
//  recordScore
//
//  Created by NWDeveloper on 2018/12/4.
//  Copyright © 2018年 ballteam. All rights reserved.
//

#import "UILabel+NSDQuickCoding.h"

@implementation UILabel (NSDQuickCoding)

+(instancetype)nsd_GetWithText:(NSString *)text
                          font:(UIFont *)font
                     textColor:(UIColor *)textColor
{
    UILabel *label = [UILabel nsd_GetWithFont:font
                                    textColor:textColor
                                textAlignment:NSTextAlignmentCenter];
    label.text = text;
    [label sizeToFit];
    return label;
}

+(instancetype)nsd_GetWithText:(NSString *)text
                          font:(UIFont *)font
                     textColor:(UIColor *)textColor
                 textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [UILabel nsd_GetWithFont:font
                                    textColor:textColor
                                textAlignment:textAlignment];
    label.text = text;
    [label sizeToFit];
    return label;
}

+(instancetype)nsd_GetWithFont:(UIFont *)font
                     textColor:(UIColor *)textColor
{
    UILabel *label = [UILabel nsd_GetWithFont:font
                                    textColor:textColor
                                textAlignment:NSTextAlignmentCenter];
    return label;
}

+(instancetype)nsd_GetWithFont:(UIFont *)font
                     textColor:(UIColor *)textColor
                 textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [UILabel new];
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    [label setBackgroundColor:[UIColor clearColor]];
    return label;
}

@end
