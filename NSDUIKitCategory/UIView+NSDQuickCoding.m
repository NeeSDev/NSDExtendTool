//
//  UIView+NSDQuickCoding.m
//  NeeSUIKitCategory
//
//  Created by apple on 2019/1/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIView+NSDQuickCoding.h"

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
@end
