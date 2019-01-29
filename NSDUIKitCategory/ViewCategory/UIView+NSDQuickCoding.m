//
//  UIView+NSDQuickCoding.m
//  NeeSUIKitCategory
//
//  Created by apple on 2019/1/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIView+NSDQuickCoding.h"
#import "MyLayout.h"

@implementation UIView (NSDQuickCoding)

#pragma mark - ========== Class Methods ====================
+(instancetype)nsd_GetClearColorView
{
    UIView *clearView = [UIView new];
    clearView.backgroundColor = [UIColor clearColor];
    return clearView;
}


#pragma mark - ========== Instance Methods ====================
-(NSDQuickViewStatus)nsd_RemoveFromSuperView
{
    if ([self superview]) {
        [self removeFromSuperview];
        return NSDQuickViewStatusSuccess;
    }
    return NSDQuickViewStatusSuperviewNone;
}

-(NSDQuickViewStatus)nsd_IsSuperiew:(UIView *)superview
{
    if ([self superview]) {
        if ([[self superview] isEqual:superview]) {
            return NSDQuickViewStatusYES;
        }
        return NSDQuickViewStatusNO;
    }
    return NSDQuickViewStatusSuperviewNone;
}

-(NSDQuickViewStatus)nsd_SetCornerRadius:(float)cornerRadius
                             BorderWidth:(float)borderWidth
                             borderColor:(UIColor *)borderColor
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
    return NSDQuickViewStatusYES;
}

-(NSDQuickViewStatus)nsd_SetBottomLineWithWidth:(float)width
                                     LineLength:(float)lineLength
                                      LineColor:(UIColor*)lineColor
{
    MyBaseLayout *lineView = [MyBaseLayout new];
    lineView.backgroundColor = lineColor;
    lineView.myHeight = width;
    lineView.centerXPos.equalTo(self);
    if (lineLength == 0) {
        lineView.myHorzMargin = 0;
    }
    else
    {
        lineView.myWidth = lineLength;
    }
    lineView.myBottom = 0;
    [self addSubview:lineView];
    return NSDQuickViewStatusYES;
}
@end
